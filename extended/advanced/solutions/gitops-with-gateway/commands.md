# Solution for the GitOps with Gateway Challenge

## 1. Reconfigure Traefik

First, we need to update the Traefik Helm release to enable the Kubernetes Gateway provider.

```bash
helm upgrade traefik traefik/traefik -n traefik --set providers.kubernetesGateway.enabled=true
```

## 2. Create the Gateway and HTTPRoute

Next, we apply the `gateway.yaml` and `http-route.yaml` to the cluster.

```bash
kubectl apply -f gateway.yaml
kubectl apply -f http-route.yaml
```

## 3. Remove the Ingress

Now that the Gateway is routing traffic to the application, we can remove the old Ingress resource.

```bash
kubectl delete ingress hello-world -n default
```

Alternatively, you can delete the `ingress.yaml` file from the `hello-world-app` directory and sync the application in Argo CD.
