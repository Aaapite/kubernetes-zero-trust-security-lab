# Findings and interpretation

The supplied screenshots show successful cross-tenant baseline traffic, a later timeout/BLOCKED result, working local API access, DNS failure when its exception was removed, and DNS restoration. A privileged pod was rejected with Forbidden and then NotFound; a compliant pod reached Running.

| Control | Source | Result and boundary |
|---|---|---|
| Namespaces and quotas | Report Sections 2.1-2.3 | Separate workloads; quota 5 pods, 1 CPU requested, 512 MiB requested; not a load test |
| Original ingress | Section 2.4, Figure 4 | Policy objects exist; screenshot ends before completed after-policy probe |
| RBAC | Section 2.5, Figure 5 | can-i: own secrets yes, other namespace no; not proof of encryption at rest |
| Egress | Public images 01-06 | Reachable before, blocked after, required local service preserved |
| Admission | Public images 07-10 | Privileged rejected; hardened non-root pod admitted |
| Deletion exercise | Section 2.6, Figure 6 | Visible-file deletion and overwrite shown; no forensic proof of physical erasure |

The temporary ingress rule is a baseline test aid. Restricted admission did not remove the already-running Nginx pod. Production hardening and workload migration remain recommendations.

## Evidence limits

Ingress after-policy evidence is incomplete. Tool versions and full cluster setup are missing. Existing scripts list state and are not comprehensive assertion tests: verify.sh can mistake an API error for pod absence, and cleanup.sh can print success after a failed command. Review outputs manually. No cluster was deployed or tested in this preparation.
