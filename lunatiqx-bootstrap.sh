#!/usr/bin/env bash
set -Eeuo pipefail

OWNER="${OWNER:-SIeepyDev}"
REPO="${REPO:-lunatiqx-registry}"
UPSTREAM="${UPSTREAM:-agentoperations/agent-registry}"
ROOT="${ROOT:-$HOME/$REPO}"
PORT="${PORT:-8080}"
IMAGE_REPO="${IMAGE_REPO:-ghcr.io/${OWNER}/${REPO}}"
IMAGE_TAG="${IMAGE_TAG:-v0.1.0}"
PUSH_IMAGE="${PUSH_IMAGE:-0}"
DEPLOY_K8S="${DEPLOY_K8S:-0}"

log() { printf '[lunatiqx] %s\n' "$*"; }
fail() { log "ERROR: $*" >&2; exit 1; }

command -v git >/dev/null || fail "git is required"
command -v go >/dev/null || fail "Go is required"
command -v curl >/dev/null || fail "curl is required"
command -v gh >/dev/null || fail "gh is required for fork/repository operations"
gh auth status >/dev/null 2>&1 || fail "gh is not authenticated"

if [[ ! -d "$ROOT/.git" ]]; then
  if ! gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
    log "Creating fork $OWNER/$REPO from $UPSTREAM"
    gh repo fork "$UPSTREAM" --fork-name "$REPO" --clone=false >/dev/null
  fi
  git clone "https://github.com/${OWNER}/${REPO}.git" "$ROOT"
fi
cd "$ROOT"

git remote get-url upstream >/dev/null 2>&1 || git remote add upstream "https://github.com/${UPSTREAM}.git"

log "Building agentctl"
go build -trimpath -o agentctl ./cmd/agentctl

if ss -ltn "( sport = :$PORT )" 2>/dev/null | grep -q LISTEN; then
  fail "port $PORT is already in use; choose PORT=..."
fi

DB_PATH="${DB_PATH:-$ROOT/registry.db}"
log "Starting LUNATIQX REGISTRY on port $PORT"
./agentctl server start --port "$PORT" --db "$DB_PATH" >/tmp/lunatiqx-registry.log 2>&1 &
SERVER_PID=$!
trap 'kill "$SERVER_PID" 2>/dev/null || true' EXIT

for _ in {1..30}; do
  if curl -fsS "http://127.0.0.1:${PORT}/api/v1/ping" >/dev/null; then
    log "Healthy: http://127.0.0.1:${PORT}"
    break
  fi
  kill -0 "$SERVER_PID" 2>/dev/null || { cat /tmp/lunatiqx-registry.log; exit 1; }
  sleep 1
done
curl -fsS "http://127.0.0.1:${PORT}/api/v1/ping" >/dev/null || { cat /tmp/lunatiqx-registry.log; exit 1; }

if [[ "$PUSH_IMAGE" == 1 ]]; then
  if command -v podman >/dev/null && podman info >/dev/null 2>&1; then
    RUNTIME=podman
  elif command -v docker >/dev/null && docker info >/dev/null 2>&1; then
    RUNTIME=docker
  else
    fail "PUSH_IMAGE=1 but no usable Docker/Podman daemon is available"
  fi
  log "Building and pushing ${IMAGE_REPO}:${IMAGE_TAG} with $RUNTIME"
  make image CONTAINER_RT="$RUNTIME" IMAGE_REPO="${IMAGE_REPO%/*}" IMAGE_NAME="${IMAGE_REPO##*/}" IMAGE_TAG="$IMAGE_TAG"
  make push CONTAINER_RT="$RUNTIME" IMAGE_REPO="${IMAGE_REPO%/*}" IMAGE_NAME="${IMAGE_REPO##*/}" IMAGE_TAG="$IMAGE_TAG"
fi

if [[ "$DEPLOY_K8S" == 1 ]]; then
  command -v kubectl >/dev/null || fail "DEPLOY_K8S=1 but kubectl is missing"
  kubectl cluster-info >/dev/null || fail "DEPLOY_K8S=1 but the configured cluster is unreachable"
  make deploy OVERLAY=k8s NAMESPACE=lunatiqx-registry
  kubectl -n lunatiqx-registry rollout status deployment/agent-registry --timeout=120s
fi

log "Setup complete; local server remains active (PID $SERVER_PID)"
wait "$SERVER_PID"
