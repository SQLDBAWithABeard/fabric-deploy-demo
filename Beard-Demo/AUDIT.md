# WAF Audit Trail
> _fabricdeploy artifact v1.0.0 | tool 0.1.0 | generated 2026-06-12_

Profile: guarded — secure defaults enforced.

Every guardrail the WAF resolver applied to this estate, each citing its source.

| Rule | Pillar | Capacity | Target | Path | Value | Action | Source | Rationale |
|------|--------|----------|--------|------|-------|--------|--------|-----------|
| SEC-NET-002 | security | Beard-Prod | - | networking.public_access | False | override-allowed | SEC-NET-002 (Secure network communications, L488, 2026-05-14) | Production data should not be publicly reachable by default. |
| SEC-NET-003 | security | Beard-Prod | - | networking.ip_firewall | False | override-allowed | SEC-NET-003 (Secure network communications, L514, 2026-05-14) | Limit which networks can reach Fabric. |
| REL-RED-001 | reliability | Beard-Prod | - | disaster_recovery | False | override-allowed | REL-RED-001 (Build self-healing through redundancy, L278, 2026-05-14) | Region-level redundancy for critical data. |
| OPS-OLS-001 | operational_excellence | Beard-Prod | prod | workspace.onelake_security.enabled | True | override-allowed | OPS-OLS-001 (Deploy changes safely, L992, 2026-05-14) | Consistent governance of production data. |
| REL-SCL-001 | reliability | Beard-Prod | - | surge_protection.enabled | True | override-allowed | REL-SCL-001 (Scale vertically and horizontally, L312, 2026-05-14) | Cap runaway background/overage usage; absorb spikes without surprise cost. |
| SEC-BASE-001 | security | * | - | - | None | advisory | SEC-BASE-001 (Start with a baseline, L417, 2026-05-14) | Baseline for controls. |
| SEC-IDN-002 | security | * | - | - | None | advisory | SEC-IDN-002 (Use identity as the foundation, L464, 2026-05-14) | No embedded credentials. |
| SEC-IDN-004 | security | * | - | - | None | advisory | SEC-IDN-004 (Use identity as the foundation, L478, 2026-05-14) | Detect and correlate. |
| SEC-SEC-001 | security | * | - | - | None | advisory | SEC-SEC-001 (Secret management, L597, 2026-05-14) | Avoid static credentials. |
| SEC-SDL-001 | security | * | - | - | None | advisory | SEC-SDL-001 (Secure Development Lifecycle, L652, 2026-05-14) | Track changes safely. |
| SEC-SDL-003 | security | * | - | - | None | advisory | SEC-SDL-003 (Secure Development Lifecycle, L661, 2026-05-14) | Protect the delivery chain. |
| REL-DR-001 | reliability | * | - | - | None | advisory | REL-DR-001 (Plan for disaster recovery, L372, 2026-05-14) | Validate recovery. |
| COST-ENV-002 | cost | * | - | - | None | advisory | COST-ENV-002 (Optimize environment costs, L893, 2026-05-14) | Prevent runaway pre-prod cost. |
| COST-GOV-001 | cost | * | - | - | None | advisory | COST-GOV-001 (Monitor costs and implement governance, L857, 2026-05-14) | Accountability. |
| OPS-IAC-001 | operational_excellence | * | - | - | None | advisory | OPS-IAC-001 (Drive deployment through code, L1042, 2026-05-14) | Consistent, repeatable deployments. |
| OPS-MON-001 | operational_excellence | * | - | - | None | advisory | OPS-MON-001 (Monitor your environment, L1076, 2026-05-14) | Retain beyond 30/14-day defaults. |
| OPS-DEP-002 | operational_excellence | * | - | - | None | advisory | OPS-DEP-002 (Deploy changes safely, L1007, 2026-05-14) | Approvals scale with risk. |
| OPS-TEST-001 | operational_excellence | * | - | - | None | advisory | OPS-TEST-001 (Don't assume everything works, L1219, 2026-05-14) | Realistic, safe testing. |
| PERF-ISO-001 | performance | * | - | - | None | advisory | PERF-ISO-001 (Plan capacity intentionally, L1278, 2026-05-14) | Avoid contention. |
| PERF-TEST-001 | performance | * | - | - | None | advisory | PERF-TEST-001 (Do performance testing, L1391, 2026-05-14) | Meaningful results. |
| PERF-OPT-001 | performance | * | - | - | None | advisory | PERF-OPT-001 (Optimize performance, L1417, 2026-05-14) | Efficiency over raw size. |

## Delivery plane (GitHub Actions pipelines)

Delivery-plane WAF rules enforced by the generated pipelines:

| Rule | Control | Source |
|------|---------|--------|
| SEC-SDL-003 | No secrets in pipeline definitions; use Key Vault references | Secure Development Lifecycle (L661, 2026-05-14) |
| OPS-DEP-002 | Prod releases require manual sign-off + code review + testing | Deploy changes safely (L1007, 2026-05-14) |
| OPS-IAC-001 | Manage Fabric via layered IaC | Drive deployment through code (L1042, 2026-05-14) |

## Post-generation checks

- terraform fmt: passed
- terraform validate beard-cap-dev/foundation: passed
- terraform validate beard-cap-dev/platform: passed
- terraform validate beard-cap-dev/content: passed
- terraform validate Beard-Prod/foundation: passed
- terraform validate Beard-Prod/platform: passed
- terraform validate Beard-Prod/content: passed
