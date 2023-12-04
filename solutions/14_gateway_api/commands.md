# Setup a Nginx Fabric Gateway to handle Ingress Traffic to your cluster

- Install and deploy the Nginx Gateway API resources
```
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v0.8.1/standard-install.yaml
kubectl apply -f https://github.com/nginxinc/nginx-gateway-fabric/releases/download/v1.0.0/crds.yaml
kubectl apply -f https://github.com/nginxinc/nginx-gateway-fabric/releases/download/v1.0.0/nginx-gateway.yaml

```
- Verify the deployment

```kubectl get pods -n nginx-gateway```

- Deploy the necessary K8s resources

```kubectl apply -f .```

