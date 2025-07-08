# Insufficient Resources - Solution

## Problem

The deployment requests more resources than available in the cluster, causing pods
to remain in Pending state.

## Solution Steps

### 1. Apply the configuration and observe the scheduling failure

```bash
kubectl apply -f insufficient-resources.yaml
kubectl get pods
kubectl describe deployment resource-greedy-app
```

### 2. Check why pods are not scheduled

```bash
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl describe pod <pod-name>
```

You'll see events like:

- `Insufficient cpu`
- `Insufficient memory`

### 3. Check cluster capacity

```bash
kubectl describe nodes
kubectl top nodes
```

### 4. Reduce resource requirements

Edit `insufficient-resources.yaml` to use reasonable values:

```yaml
replicas: 3  # Reduced from 10

# Web server container
resources:
  requests:
    memory: "512Mi"   # Reduced from 4Gi
    cpu: "200m"       # Reduced from 3000m
  limits:
    memory: "1Gi"     # Reduced from 8Gi
    cpu: "500m"       # Reduced from 4000m

# Background worker container  
resources:
  requests:
    memory: "256Mi"   # Reduced from 2Gi
    cpu: "100m"       # Reduced from 1500m
  limits:
    memory: "512Mi"   # Reduced from 4Gi
    cpu: "200m"       # Reduced from 2000m
```

### 5. Apply the fixed configuration

```bash
kubectl apply -f insufficient-resources.yaml
kubectl get pods
kubectl describe deployment resource-greedy-app
```

