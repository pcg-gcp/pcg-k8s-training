# Charting Chaos - Solution

## Problem

Practice Helm chart management including installation, upgrades, and rollbacks.

## Solution Steps

### 1. Install the Helm chart

```bash
helm install charting-chaos beginner/charting-chaos
```

### 2. Examine the initial resources

```bash
kubectl get all -l app.kubernetes.io/instance=charting-chaos
kubectl get secret charting-chaos-secret -o yaml
```

### 3. Upgrade the chart with new values

```bash
helm upgrade charting-chaos beginner/charting-chaos --set secretValue=changed456
```

### 4. Compare the secret after upgrade

```bash
kubectl get secret charting-chaos-secret -o yaml
```

Notice the secret value has changed.

### 5. Check Helm release history

```bash
helm history charting-chaos
```

### 6. Rollback to previous version

```bash
helm rollback charting-chaos 1
```

### 7. Verify the rollback worked

```bash
kubectl get secret charting-chaos-secret -o yaml
helm history charting-chaos
```

### 8. Clean up when done

```bash
helm uninstall charting-chaos
```

