# Flaky Initializer - Solution

## Problem

The initialization job fails on first run but succeeds on second run, demonstrating
how persistent storage preserves state across pod executions.

## Solution Steps

### 1. Apply the configuration and observe the failures

```bash
kubectl apply -f flaky-initializer.yaml
kubectl get jobs
kubectl get pods
kubectl describe job app-initializer
```

### 2. Check the job failure

```bash
kubectl logs job/app-initializer
```

### 3. Delete and recreate the job

```bash
kubectl delete job app-initializer
kubectl apply -f flaky-initializer.yaml
```

### 4. Observe the job succeeds this time

```bash
kubectl get jobs
kubectl logs job/app-initializer
```

### 5. Verify the deployment now works

```bash
kubectl get deployments
kubectl get pods
kubectl logs deployment/flaky-app
```

