# Method and scope

Lab 2 created tenant-a and tenant-b with Nginx workloads labelled app=web, then checked connectivity, resource limits, secret permissions and deletion behavior. Lab 2.1 used api Service aliases for those workloads and a temporary Tenant B ingress exception to isolate the effect of Tenant A egress filtering.

The addendum recorded cross-tenant access before and after default-deny egress, preserved DNS and local TCP/80 access, removed DNS to show the dependency, restored it, then enabled Restricted admission. Network probes preceded admission enforcement because basic kubectl run probes can be rejected afterwards.

Existing reviewed manifests and shell scripts are included unchanged. See [reproduction notes](../reproduction.md). They assume the earlier lab environment; they do not create a complete cluster.

## Review method

The source text and available images were inspected, claims were matched to source locations, and unsupported wording was narrowed. Public output excludes original coversheets, student numbers, contact lists and full captured credentials/tokens. Recommendations are proposed actions, not completed remediation.
