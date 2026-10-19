# SUPERNOVA Control Plane v0.1
Date: 2026-10-19
Status: experimental scaffold; not deployed or scheduled.
Branch: experiment/supernova-control-plane-2026-10-19

## Objective
Discover, create, simulate, test, version, and publish games and reusable capabilities using explicitly authorized connectors. Every loop must produce durable evidence and must stop when its budget or acceptance criteria fail.

## Existing systems discovered (read-only inventory, 2026-10-19)
- Airtable: Connector OS (Connectors, Weekly_Caps, Jobs, Projects, Activity_Log, Automation_Runbooks); SPHYNX Memory Core; SPHYNX FREE FOUNDRY.
- GitHub: lunatiqx-registry and fleet-inventory unarchived; other 32 repositories archived at inventory time.
- Supabase: Sphynx Development active and healthy (PostgreSQL 17).
- Railway: SleepyAdmin project.
- Vercel: nexus-studio and other existing projects.
- Floot: Signal Garden, SPHYNX Studio, Sphynx Foundry, SPHYNX Forge.
- Notion: Capability Registry & Dependency Graph; Failure → Lesson → Capability Registry.
Do not treat existing project discovery as evidence of remaining capacity or working deployment.

## Ownership routing
| Artifact | Primary | Replica / index | Verification |
|---|---|---|---|
| Source code, tests, manifests | GitHub branch / pull request | Independent versioned backup where permitted | commit SHA + CI result |
| Structured operational events and quotas | Airtable Connector OS | Export to versioned object storage | record ID + readback |
| Queryable world state | Supabase PostgreSQL | managed database backup after actual backup policy inspection | transaction/readback |
| Knowledge, decisions, human-readable runbooks | Notion | GitHub Markdown snapshots | source URL + timestamp |
| Generated media and large artifacts | object storage provider selected by measured limits | second provider where lawful & economical | checksum + restore drill |
| Hosting and execution | Vercel / Railway / Render depending on workload | source-backed redeploy | live route + smoke tests |
| AI model/paper catalog | Hugging Face plus curated metadata | Notion / Airtable index | source, model license, revision |

## Typed records
Connector: connector_id, capability, tool_name, permissions, environment, verified_at, evidence_ref, quota_units, quota_period, quota_limit, quota_used, quota_reset_at, price_per_unit, last_error.
Capability: id, version, inputs_schema, outputs_schema, preconditions, side_effects, sandbox_mode, live_mode, tests, provenance, owner.
Artifact: artifact_id, producer_run_id, source_refs, license, content_hash, location, version, quality_metrics, verified_at.
Run: run_id, idempotency_key, goal, budget, status, created_at, started_at, completed_at, inputs, outputs, receipts, errors, next_action.
Experiment: hypothesis, baseline, intervention, conditions, results, evaluation, limitations, replay_instructions.

## Execution state machine
DISCOVERED -> PLANNED -> AUTHORIZED -> RUNNING -> VERIFYING -> VERIFIED -> PUBLISHED
Failure path: RUNNING/VERIFYING -> UNCERTAIN -> RECONCILING -> VERIFIED or FAILED.
No retry of a non-idempotent write before reading existing external state.
No 'PUBLISHED' status without an actual accessible artifact and smoke test.
No 'VERIFIED' status without passing objective acceptance criteria.

## Quota-aware dispatch
1. Read live quota from provider endpoint/tool when available. Save usage value, unit, time window, and source, or mark unknown.
2. Estimate each task's requests/tokens/compute/storage/network cost, plus reserve margin.
3. When remaining quota is unknown: bounded trial only; never claim unlimited.
4. Stop on rate limit, billing threshold, permission denial, safety gate, or repeated errors.
5. Retry only idempotent reads or reconciled writes using provider-defined backoff.
6. Each cycle evaluates value gained per marginal resource; stop when improvement cannot be demonstrated.

## Recursive build loop
RESEARCH -> SOURCE & LICENSE AUDIT -> SPECIFY -> BUILD IN SANDBOX -> TEST -> COMPARE AGAINST BASELINE -> PROMOTE OR REJECT -> SNAPSHOT -> NEXT ITERATION.
For game reproductions, use licensed assets or original assets and reproduce functional concepts without distributing unauthorized proprietary source or media.
Cybersecurity arenas must be isolated or explicitly authorized.

## First five game factories
1. Invention Time Machine: reconstruct historical technologies under documented material constraints.
2. Physics Foundry: simulate fluids, motion, structures, energy and manufacturing.
3. Paper Market Universe: replay historical market datasets with fees, slippage and no real orders.
4. CTF Lab: sandboxed cyber-defense and detection exercises.
5. Game Forge: generate and evaluate small browser-playable games with automated smoke tests.

## First acceptance tests
- Registry: uniqueness by stable connector+capability key; duplicate write rejected or reconciled.
- Quota: unknown is distinct from zero; source/period/unit stored; budget denial enforced.
- Artifacts: checksum verified after reading back from storage.
- Simulations: seeded runs reproducible; results bounded and labeled simulated.
- Deployments: live URL health checked independently and rollback documented.
- Backups: restore drill to an isolated environment; copies alone are not verified backups.
- Evidence: a test result becomes invalid when relevant dependency or configuration changes.

## Non-goals of this scaffold
No claim of 24/7 execution, no uncontrolled consumption of quotas, no new billing resources, no automatic public publication, no copying private data across providers, and no alteration of existing applications without project-specific validation.

## Next executable milestone
Inventory provider usage and connection scopes, reconcile existing Airtable Weekly_Caps entries, create a read-only quota snapshot, and implement one sandboxed game factory in a dedicated experimental branch. Promote only after tests and explicit approval for consequential external writes.
