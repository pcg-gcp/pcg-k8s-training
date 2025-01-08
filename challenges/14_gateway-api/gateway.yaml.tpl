apiVersion: gateway.networking.k8s.io/v1beta1
kind: Gateway
metadata:
  name: marius-gateway
  namespace: <your-namespace>
spec:
  gatewayClassName: ???
  # For GCP see: https://cloud.google.com/kubernetes-engine/docs/how-to/deploying-gateways#external-gateway
  listeners:
  - ???