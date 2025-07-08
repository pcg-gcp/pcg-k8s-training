apiVersion: gateway.networking.k8s.io/v1beta1
kind: HTTPRoute
metadata:
  name: demo-route
  namespace: <your-namespace>
spec:
  parentRefs:
  - name: <your-gateway>
    namespace: <namespace of gateway>
  hostnames:
  - "<IP Address>.nip.io"
  rules:
  - matches:
    - path:
        type: PathPrefix
        value: /
    backendRefs:
    - name: ???
      port: ???