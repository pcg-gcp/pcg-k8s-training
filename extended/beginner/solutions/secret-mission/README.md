# Secret Mission - Solution

## Problem

The pod references a secret `db-secret` that doesn't exist in the cluster.

## Solution Steps

### 1. Apply the configuration and observe the failure

```bash
kubectl apply -f secret-mission.yaml
kubectl get pods
kubectl describe pod secret-consumer
```

### 2. Create the missing secret

```bash
kubectl create secret generic db-secret --from-literal=password=supersecret
```

### 3. Verify the pod starts successfully

```bash
kubectl get pods
kubectl logs secret-consumer
```

