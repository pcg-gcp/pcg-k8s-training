# Grand Finale - Solution

## Problem

Multiple configuration issues prevent the deployment from working:

1. Missing namespace
2. Label selector mismatches
3. Missing service account
4. Secret/ConfigMap reference errors
5. Missing PVC
6. Port mismatches in health checks

## Solution Steps

### 1. Apply the configuration and observe failures

```bash
kubectl apply -f grand-finale.yaml
```

### 2. Create the missing namespace

```bash
kubectl create namespace grand-finale
kubectl apply -f grand-finale.yaml
```

### 3. Check deployment status

```bash
kubectl get deployments -n grand-finale
kubectl get pods -n grand-finale
kubectl describe deployment broken-web-app -n grand-finale
```

### 4. Fix the configuration issues

#### Create missing ServiceAccount

```bash
kubectl create serviceaccount web-app-service-account -n grand-finale
```

#### Create missing PVC

```bash
kubectl apply -f - <<EOF
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: app-data-pvc
  namespace: grand-finale
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
EOF
```

#### Fix the deployment YAML

Edit `grand-finale.yaml`:

```yaml
# Fix label selector mismatch
selector:
  matchLabels:
    app: web-application  # was: broken-web-app

# Fix pod labels
template:
  metadata:
    labels:
      app: web-application  # was: broken-web-app

# Fix service account reference
serviceAccountName: web-app-service-account  # create this SA

# Fix ConfigMap references
configMapKeyRef:
  name: app-config  # was: app-settings

# Fix Secret references
secretKeyRef:
  name: database-credentials  # was: db-secret
  key: username  # was: user

# Fix PVC reference
persistentVolumeClaim:
  claimName: app-data-pvc  # create this PVC

# Fix health check ports and paths
livenessProbe:
  httpGet:
    path: /     # was: / (already correct)
    port: 80    # was: 8080
readinessProbe:
  httpGet:
    path: /     # was: /ready
    port: 80    # was: 8080
```

### 5. Apply the fixed configuration

```bash
kubectl apply -f grand-finale.yaml
kubectl get pods -n grand-finale
kubectl logs deployment/broken-web-app -n grand-finale
```

