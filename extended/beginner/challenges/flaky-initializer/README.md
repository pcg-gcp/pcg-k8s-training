# Flaky Initializer Challenge

## Goal

Understand application initialization patterns, how Jobs handle failures,
and how persistent storage maintains state across different workloads.

## Your Task

1. Apply the YAML configuration and observe the job failure
2. Understand why the job fails but creates persistent data
3. Delete and recreate the job to see it succeed on second run
4. Observe how the deployment depends on successful initialization

## Helpful Resources

- [Jobs](https://kubernetes.io/docs/concepts/workloads/controllers/job/)
- [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
- [Pod Lifecycle](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/)
- [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

