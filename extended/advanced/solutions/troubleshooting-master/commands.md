# Solution for the Troubleshooting Master Challenge

## 1. Fix the Argo CD Application

The `Application` resource is pointing to the wrong path in the Git repository. We need to correct the `path` to point to the `broken-app` directory.

**Corrected `argocd-app.yaml`:**

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: super-app
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/user/pcg-k8s-training.git
    targetRevision: HEAD
    path: extended/advanced/troubleshooting-master/broken-app # Corrected path
  destination:
    server: https://kubernetes.default.svc
    namespace: super-app-backend
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

Apply the corrected `argocd-app.yaml`:

```bash
kubectl apply -f argocd-app.yaml
```

## 2. Fix the Gateway and Ingress Conflict

The `gateway.yaml` file contains both a `Gateway` and an `Ingress` resource. We need to remove the `Ingress` resource and create an `HTTPRoute` to route traffic from the `Gateway` to the `frontend` service.

**Corrected `gateway.yaml`:**

```yaml
apiVersion: gateway.networking.k8s.io/v1beta1
kind: Gateway
metadata:
  name: super-app-gateway
  namespace: super-app-frontend
spec:
  gatewayClassName: traefik
  listeners:
  - name: web
    port: 80
    protocol: HTTP
    allowedRoutes:
      namespaces:
        from: All
```

**New `http-route.yaml`:**

```yaml
apiVersion: gateway.networking.k8s.io/v1beta1
kind: HTTPRoute
metadata:
  name: frontend-route
  namespace: super-app-frontend
spec:
  parentRefs:
  - name: super-app-gateway
    namespace: super-app-frontend
  hostnames:
  - "super-app.local"
  rules:
  - matches:
    - path:
        type: PathPrefix
        value: /
    backendRefs:
    - name: frontend
      port: 80
```

Apply the corrected `gateway.yaml` and the new `http-route.yaml`:

```bash
kubectl apply -f gateway.yaml
kubectl apply -f http-route.yaml
```

## 3. Fix the Cross-Namespace RBAC

The `backend` service needs to access a `Secret` in the `super-app-frontend` namespace, but the `Role` is in the wrong namespace. We need to create a `Role` in the `super-app-frontend` namespace and a `RoleBinding` in the `super-app-backend` namespace that references the `Role`.

**New `secret.yaml`:**

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: backend-secret
  namespace: super-app-frontend
type: Opaque
data:
  secret-key: c2VjcmV0Cg== # "secret" in base64
```

**Corrected `rbac.yaml`:**

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: backend-sa
  namespace: super-app-backend
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: backend-role
  namespace: super-app-frontend # Correct namespace
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: backend-rb
  namespace: super-app-backend
subjects:
- kind: ServiceAccount
  name: backend-sa
  namespace: super-app-backend
roleRef:
  kind: Role
  name: backend-role
  apiGroup: rbac.authorization.k8s.io
```

Apply the new `secret.yaml` and the corrected `rbac.yaml`:

```bash
kubectl apply -f secret.yaml
kubectl apply -f rbac.yaml
```

## 4. Fix the Network Policy

The `NetworkPolicy` is blocking all egress traffic from the `backend` service. We need to allow egress traffic to the Kubernetes API server.

**Corrected `network-policy.yaml`:**

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: backend-allow-egress
  namespace: super-app-backend
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
  - Egress
  egress:
  - to:
    - namespaceSelector: {}
      podSelector:
        matchLabels:
          k8s-app: kube-dns
    ports:
    - protocol: UDP
      port: 53
  - to:
    - ipBlock:
        cidr: 0.0.0.0/0
```

Apply the corrected `network-policy.yaml`:

```bash
kubectl apply -f network-policy.yaml
```

## 5. Fix the Horizontal Pod Autoscaler

The `HorizontalPodAutoscaler` is too aggressive. We need to adjust the `averageUtilization` to a more reasonable value.

**Corrected `backend.yaml`:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend
  namespace: super-app-backend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      serviceAccountName: backend-sa
      containers:
      - name: backend
        image: gcr.io/google-samples/hello-app:1.0
        ports:
        - containerPort: 8080
        env:
        - name: SECRET_KEY
          valueFrom:
            secretKeyRef:
              name: backend-secret
              key: secret-key
---
apiVersion: v1
kind: Service
metadata:
  name: backend
  namespace: super-app-backend
spec:
  selector:
    app: backend
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: backend-hpa
  namespace: super-app-backend
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: backend
  minReplicas: 1
  maxReplicas: 5
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50 # Corrected value
```

Apply the corrected `backend.yaml`:

```bash
kubectl apply -f backend.yaml
```
