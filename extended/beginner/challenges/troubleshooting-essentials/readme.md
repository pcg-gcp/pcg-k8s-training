# Troubleshooting Essentials Challenge

## Goal

Diagnose and fix a broken web application that is failing to deploy and scale
due to common configuration errors.

## Your Task

1.  Apply all the YAML configurations provided in this directory.
2.  Systematically identify and correct the issues preventing the `webapp`
    from starting and scaling correctly.
3.  The application is suffering from three distinct problems:
    *   An RBAC misconfiguration.
    *   A restrictive Network Policy.
    *   A broken Horizontal Pod Autoscaler.
4.  Verify that the `webapp` deployment is running, accessible, and that the
    HPA is active and correctly targeting the deployment.

## Helpful Resources

*   [Debugging Pods](https://kubernetes.io/docs/tasks/debug/debug-application/debug-pods/)
*   [Kubernetes RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
*   [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
*   [Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
