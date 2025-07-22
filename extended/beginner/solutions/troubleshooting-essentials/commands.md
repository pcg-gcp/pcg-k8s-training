# Solution for the Troubleshooting Essentials Challenge

## 1. Fix the RBAC Permissions

The `webapp-role` is missing the permission to read `ConfigMaps`. We need to add this permission to the `Role`.

**Corrected `rbac.yaml`:**

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: webapp-sa
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: webapp-role
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]
- apiGroups: [""]
  resources: ["configmaps"]
  verbs: ["get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: webapp-rb
subjects:
- kind: ServiceAccount
  name: webapp-sa
  namespace: default
roleRef:
  kind: Role
  name: webapp-role
  apiGroup: rbac.authorization.k8s.io
```

Apply the corrected `rbac.yaml`:

```bash
kubectl apply -f rbac.yaml
```

## 2. Fix the Network Policy

The `NetworkPolicy` is blocking all ingress traffic. We need to allow ingress traffic from the Ingress controller.

**Corrected `network-policy.yaml`:**

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: webapp-allow-ingress
spec:
  podSelector:
    matchLabels:
      app: webapp
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app.kubernetes.io/name: traefik
```

Apply the corrected `network-policy.yaml`:

```bash
kubectl apply -f network-policy.yaml
```

## 3. Fix the Horizontal Pod Autoscaler

The `HorizontalPodAutoscaler` is targeting a non-existent `Deployment`. We need to correct the `scaleTargetRef` to point to the `webapp` `Deployment`.

**Corrected `deployment.yaml`:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webapp
  template:
    metadata:
      labels:
        app: webapp
    spec:
      serviceAccountName: webapp-sa
      containers:
      - name: webapp
        image: gcr.io/google-samples/hello-app:1.0
        ports:
        - containerPort: 8080
        envFrom:
        - configMapRef:
            name: webapp-config
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: webapp-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: webapp # Corrected name
  minReplicas: 1
  maxReplicas: 5
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
```

Apply the corrected `deployment.yaml`:

```bash
kubectl apply -f deployment.yaml
```
