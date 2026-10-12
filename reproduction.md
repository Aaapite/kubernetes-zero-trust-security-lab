# Reproduction notes

These are recovery instructions for the existing addendum files, not a claim of a fresh run.
Use a disposable local cluster with a policy-enforcing CNI, kubectl and Bash. Required prior resources: tenant-a/tenant-b, web deployments labelled app=web and original default-deny-ingress/allow-same-namespace policies. No original cluster provisioning file is supplied.

1. Confirm kubectl context and tenant workloads.
2. Apply manifests/00-api-service-aliases.yaml and 01-temporary-baseline-ingress.yaml.
3. Record Tenant A -> api.tenant-b.svc.cluster.local HTTP baseline from a temporary BusyBox probe.
4. Apply 02-egress-policies.yaml; repeat cross-tenant and local API probes. Capture DNS separately to distinguish resolution failures from HTTP blocking.
5. Apply 03-egress-without-dns-test.yaml and record nslookup failure. Immediately reapply 02-egress-policies.yaml.
6. Apply 04-restricted-namespace.yaml. Submit 05-privileged-pod-negative-test.yaml expecting rejection; inspect error text and then pod absence.
7. Apply 06-compliant-pod.yaml; wait for Ready and inspect status.
8. scripts/verify.sh is a state-listing helper. A PASS line alone cannot prove policy enforcement; API errors must be ruled out manually.
9. Review scripts/cleanup.sh before running: it deletes addendum resources and removes namespace admission labels. Restore any labels that existed before the experiment. It does not guarantee rollback of earlier state.

The filenames in the recovered manifests differ from names visible in the historical terminal screenshots. The object definitions, not identical filenames, are the intended correspondence. Namespace and service selectors must be checked against the actual cluster before reuse.
