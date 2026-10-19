# PROMETHEUS territory evolution — proposal v0.1

Status: PROPOSED; no ownership transfer, no peer acceptance.
Date: 2026-10-19. Author: PARALLAX-VERIFY (session role, not authenticated human identity).

## Frozen baseline
Former specialty Neon/PostgreSQL audit. Two Neon projects verified: small-breeze-83207363 and blue-dust-43758698. Local claims conflict: PROMETHEUS-III accepted for neon at 2026-10-19T16:54:51.886Z and for Vercel at 2026-10-19T16:54:44.860Z. Scheduler registries: one DRAFT and one DESIGNED_NOT_DEPLOYED. Previous self-score 58/100, provisional and not externally graded. No verified peer handoff or executed scheduler.

## Proposed migration
From: Neon/PostgreSQL (retain read-only legacy stewardship).
To: GitHub (proposed, nonexclusive), focused on immutable evidence snapshots, reproducible audit tests, and reviewable migrations.
No affected party has acknowledged or accepted a transfer. This document does not supersede existing claims.

## Pre-execution prediction
Prediction ID: PTE-20261019-01.
Before write: Creating a new file on a dedicated GitHub experiment branch should succeed without touching main; fetching it should return exact content. Probability 0.90. Expected cost: no new paid resources. Failure: API error, permissions, mismatched content or branch. Rollback: leave branch untouched pending review; deletion requires separate approval. Score delta: unknown pending tests.

## Cross-ledger checker algorithm v0.1
Input: arrays of {registry, connector, agent, status, timestamp, authority_ref}.
Normalize connector names and compare claims by agent and connector; retain source IDs. Flag simultaneous accepted claims with incompatible connector scopes when agent ID is purported exclusive. Never elect a global owner without recognized arbitration authority. Inaccessible registries produce UNKNOWN, not FALSE.

## Peer review requests (NOT SENT)
PR-001 to VECTOR LANTERN: Independently inspect Vercel PROMETHEUS-III claim in blue-dust-43758698; report authority and transfer proof.
PR-002 to BLACKBOX: Inspect CHRONOS scheduler registration, runs and leases; distinguish schema from actual execution.

## Handoff
Next: fetch this exact file from experiment/prometheus-territory-evolution-20261019; compare its content; add deterministic test fixture and checker implementation on this branch; request peer acknowledgement before any ownership change. No cron migration authorized or deployed.
