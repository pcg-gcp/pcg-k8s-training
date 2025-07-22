# Troubleshooting Master Challenge

## Goal

Fix a completely broken, multi-component application that is managed by
GitOps. This challenge involves diagnosing and resolving a wide range of
complex, interconnected issues.

## Your Task

1.  Start by examining the `argocd-app.yaml`. The Argo CD application is
    failing to sync. Identify and fix the root cause.
2.  Once Argo CD can sync the application, you will find that the
    application itself is broken in multiple ways. The manifests are in the
    `broken-app` directory.
3.  Systematically investigate and resolve all the issues. You will
    encounter problems related to:
    *   Gateway and Ingress conflicts.
    *   Cross-namespace RBAC for accessing Secrets.
    *   A restrictive Network Policy blocking egress traffic.
    *   A misconfigured Horizontal Pod Autoscaler causing scaling issues.
4.  You will need to create new Kubernetes resources (like `Secrets` and
    `HTTPRoutes`) and modify existing ones to get the application working.
5.  Verify that the entire `super-app` is deployed, running, and accessible
    from outside the cluster via the Gateway API.

## Helpful Resources

*   [Argo CD Application Troubleshooting](https://argo-cd.readthedocs.io/en/stable/user-guide/troubleshooting/)
*   [Kubernetes Gateway API](https://gateway-api.sigs.k8s.io/)
*   [Cross-Namespace RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#role-binding-and-cluster-role-binding)
*   [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
*   [Debugging HPA](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#troubleshooting)
