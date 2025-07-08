# Volume Mount Mystery - Solution

## Problem

Multiple configuration mismatches prevent the deployment from working correctly:

- PVC name mismatch: references `application-data` but PVC is named `my-app-storage`
- ConfigMap name mismatch: references `app-settings` but ConfigMap is named `app-config`
- Mount path issue: `$(DATA_PATH)` creates a literal directory named `$(DATA_PATH)` instead of using the environment variable value

## Solution Steps

### 1. Apply the configuration and observe the failure

```bash
kubectl apply -f volume-mount-mystery.yaml
kubectl get deployments
kubectl get pods
kubectl describe deployment reference-riddle
```

### 2. Identify the configuration issues

- PVC `application-data` doesn't exist (should be `my-app-storage`)
- ConfigMap `app-settings` doesn't exist (should be `app-config`)
- Mount path `$(DATA_PATH)` creates a literal directory instead of using the env var value

### 3. Fix the configuration

Edit `volume-mount-mystery.yaml`:

```yaml
# Fix the PVC reference
claimName: my-app-storage  # was: application-data

# Fix the ConfigMap reference  
name: app-config  # was: app-settings

# Fix the mount path to use a literal path
mountPath: /app/data  # was: $(DATA_PATH)
```

### 4. Apply the fixed configuration

```bash
kubectl apply -f volume-mount-mystery.yaml
kubectl get deployments
kubectl get pods
kubectl logs deployment/reference-riddle
```

## Key Learning Points

- Resource names must match exactly between definitions and references
- Environment variable syntax doesn't work in mountPath - use literal paths
- Using `kubectl describe` to debug configuration issues  
- Understanding the relationship between PVCs, ConfigMaps, and deployments
- How to identify when volumes create unexpected directory structures