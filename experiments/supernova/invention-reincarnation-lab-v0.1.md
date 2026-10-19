# OMNIVERSE OMEGA — Invention Reincarnation Laboratory v0.1
Date: 2026-10-19
Status: research-backed experiment specification, NOT empirical validation
Parent: experiments/supernova/control-plane-v0.1.md

## Goal
Translate historical discoveries into safe, reproducible simulations, derive domain-transfer hypotheses, and promote only independently verified improvements.

## Canonical experiment lifecycle
SOURCE -> ASSERT CLAIM AND UNCERTAINTY -> RECONSTRUCT CONTEXT -> IDENTIFY MECHANISM -> DEFINE COUNTERFACTUAL -> MODEL -> TEST CONTROLS -> DOCUMENT FAILURES -> TRANSFER -> VALIDATE -> VERSION -> PUBLISH OR REJECT.

Historical recurrence is not a law of identical repetitions. Prefer mechanisms: feedback, resource bottlenecks, network effects, institutional lock-in, resilience, standardization, modularity, redundancy, information preservation, selection and recombination.

## Research seed experiments
| ID | Historical origin | Mechanism | Cross-domain proposal | Test / uncertainty |
| FOOD-001 | Traditional fermentation | Microbial ecosystems transform materials under selective conditions | Safe simulated fermentation-to-modern process control game | Compare process control, yield, safety assumptions; no unsupervised wet-lab or claims of edible products |
| MAT-001 | Ancient Roman lime mortar | Mineral chemistry, mixture preparation, potential crack-healing | Self-healing material simulation and maintenance scheduling | Simulate repair rate, lifetime, embodied emissions; cannot extrapolate historical durability universally |
| WATER-001 | Gravity-fed aqueducts and irrigation | Gradient, head, flow, maintenance | Passive water-energy systems for virtual cities | Conservation of mass and energy, flow validation |
| INFO-001 | Writing, ledgers, double-entry bookkeeping | Externalized memory and consistency checks | Event-sourced connector world registry | Replay ledger, reconciliation, duplicate detection |
| TOOL-001 | Standardized interchangeable parts | Interfaces enable composability | Typed connector capability grammar | Adapter conformance tests; intentionally incompatible cases |
| FOOD-002 | Crop rotation and seed selection | Ecological cycles, diversity and selection | Procedural farm-to-table civilization sandbox | Yield vs resilience across simulated seasons |
| ANIME-001 | Key poses, in-betweening, layered compositing | Sparse control points generate complex apparent motion | Anime story-to-scene production simulator | Keyframe interpolation, lip-sync timing, asset provenance |
| ANIME-002 | Storyboards and production sheets | Shared visual intent across specialized roles | Cross-tool shot manifest from script to animation to audio | Export/import contract; timecodes; reproducible render |
| SOC-001 | Collapse of interdependent complex societies | Resource, governance, coordination and shock propagation | Counterfactual civilization simulator | Sensitivity analysis: avoid monocausal history claims |
| COMPUTE-001 | Mechanical automata and looms | Encoded instructions, modular actuation | Visual programming game spawning tool factories | Reproducible interpreter, bounded runtime |

## Primary evidence to check
- Allard (2023) Nature Reviews Materials, 'Self-healing Roman concrete' DOI 10.1038/s41578-023-00539-z; references Seymour et al. (2023) Science Advances DOI 10.1126/sciadv.add1602.
- Obayomi et al. (2026), Biotechnology Reports, 'Transition from fermentation to precision fermentation', DOI 10.1016/j.btre.2026.e00952.
- 2026 Current Opinion in Biotechnology, 'From ancestral fermentations to engineered food consortia', DOI 10.1016/j.copbio.2026.103554.
These sources justify candidate mechanisms, not the success of our proposed software or physical products.

## General-purpose invariants
1. Provenance: source URLs, source timestamps, source reliability, licensing and intellectual property.
2. Identity: stable object IDs, project IDs, schema versions, semantic versions.
3. Authority: actor, permission, approval, data-handling boundaries.
4. Capability: tool signature, preconditions, supported/unsupported features.
5. Budget: time, requests, tokens, compute, storage, money, energy; unknown distinct from unlimited.
6. Evidence: deterministic test inputs, control group/baseline, observed outputs, error bounds.
7. Logging: input hash, output hash, timestamps, run ID, tool version, status transitions.
8. Recovery: idempotency, retries, snapshot, rollback, restore-tested backups.
9. Evaluation: significance, reproducibility, utility, resource cost, failure conditions.
10. Learning: reusable hypotheses, falsified ideas, counterexamples, expiration of verification.
11. Safety: biological/food safety, cybersecurity authorization, simulation-vs-reality labeling.
12. Continuity: next action, accountable owner, durable receipts.

## Persona functions (roles, not claims of independent agents)
Historian/Archivist: source criticism and chronology
Scientist: causal hypotheses and controls
Engineer: reproducible implementation
Artist/Director: creative synthesis, story and aesthetic judgment
Chef/Food Scientist: edible-process constraints and safe production
Skeptic/Red Team: falsification and misuse screening
Auditor: evidence, rights, receipts, budgets
Integrator: cross-connector type compatibility and recovery
Teacher: skill transfer and assessment
Steward: long-term maintenance, upgrade compatibility and backups

## Structured schemas (contract examples)
Discovery {id,title,era,location,source_references[],known_mechanism,contested_claims[],confidence,license}
Experiment {id,discovery_id,hypothesis,baseline,variables[],controls[],procedure,simulation_or_real,seed,metrics[],result,status,assumptions,artifacts[]}
Transfer {id,source_experiment,target_domain,shared_mechanism,adapter_contract,conflicts[],tests[],outcome}
World {id,genre,systems[],ruleset_version,asset_manifest,resource_budget,simulation_seed,save_state,build_version}
Tool {id,connector,operation,input_schema,output_schema,permissions,rate_limit_snapshot,rollback_strategy}
Event {event_id,actor,operation,input_hash,output_hash,source,observed_at,receipt_uri,verification_status}

## Concrete MVP: 'TIMELINE COLLIDER'
Browser game containing (1) choice of old invention, (2) exposed historical constraints,
(3) adjustable variables, (4) a deterministic simplified model, (5) side-by-side alternate timelines,
(6) record of which outcome is simulated, sourced, or verified, (7) portable JSON scenario manifest.
Start with WATER-001 because the physical mechanism has simple conservation checks.
Do not imply simulations reproduce historical causation without independent validation.

## Adversarial acceptance tests
- Every research assertion has a source or is explicitly flagged as hypothesis.
- No simulation result is represented as real-world verification.
- Variable changing in deterministic model changes only predicted dependent values.
- Mass/energy accounting never generates resources spontaneously.
- Artifact readback matches the expected content hash.
- Multiple connectors never own divergent 'canonical' status without reconciliation.
- Unknown or expired quota causes bounded or deferred work, not unchecked production.
- A failed test cannot be promoted to a verified capability.
- Unknown license forbids asset reuse pending clearance.
- Historical society cannot be reduced to deterministic 'cycle' labels without caveats.

## Milestone statuses
Research seed curation: DONE (three literature anchors)
Typed schema: DRAFT
Game engine: NOT IMPLEMENTED
External worker/schedule: NOT STARTED
Empirical reproduction: NOT PERFORMED
Live deploy: NOT PERFORMED
