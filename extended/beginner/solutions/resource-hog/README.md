# Resource Hog - Solution

## Problem

The pod continuously allocates memory until it exceeds its limits and get
killed by Kubernetes.

## Solution Steps

### 1. Apply the configuration and observe the behavior

```bash
kubectl apply -f resource-hog.yaml
kubectl get pods
kubectl describe pod resource-hog
```

### 2. Monitor resource usage

```bash
kubectl top pods
kubectl logs resource-hog
```

### 3. Observe the OOMKill behavior

```bash
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl describe pod resource-hog
```

The pod will show:

- `OOMKilled` status
- `Reason: OOMKilled` in events
- Container restart count increasing

