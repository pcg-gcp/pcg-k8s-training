apiVersion: gateway.networking.k8s.io/v1beta1
kind: Gateway
metadata:
  name: marius-gateway
  namespace: <your-namespace>
spec:
  gatewayClassName: ???
  listeners:
  - ???