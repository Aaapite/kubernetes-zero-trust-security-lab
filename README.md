# Kubernetes multi-tenancy and Zero Trust lab

Inventory ID: 2. Status: **completed work documented**.

A local kind/Calico laboratory covering namespace separation, quotas, ingress policies, RBAC, egress allow rules and Restricted Pod Security admission. Egress and admission results have full supplied evidence. Original Lab 2 ingress outcome remains partial.

## Read the work

- [Method and scope](docs/method.md)
- [Findings and interpretation](docs/findings.md)
- [Evidence register](evidence/README.md)
- [Contribution and AI assistance](CONTRIBUTIONS.md)
- [Limitations and next steps](PROGRESS.md)

## Main result

The supplied screenshots show successful cross-tenant baseline traffic, a later timeout/BLOCKED result, working local API access, DNS failure when its exception was removed, and DNS restoration. A privileged pod was rejected with Forbidden and then NotFound; a compliant pod reached Running.

## Evidence boundary

This portfolio package summarizes supplied academic material. Source reports remain private because they contain student or contact information. Source titles, exact sections and file hashes are recorded in the evidence register; selected public assets are linked there. Findings are limited to those records. No practical lab was rerun during portfolio preparation on 12 October 2026.

Ingress after-policy evidence is incomplete. Tool versions and full cluster setup are missing. Existing scripts list state and are not comprehensive assertion tests: verify.sh can mistake an API error for pod absence, and cleanup.sh can print success after a failed command. Review outputs manually. No cluster was deployed or tested in this preparation.

## References

- [Kubernetes NetworkPolicy](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/)
