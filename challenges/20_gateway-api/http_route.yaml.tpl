apiVersion: gateway.networking.k8s.io/v1beta1
kind: HTTPRoute
metadata:
  name: demo-route
  namespace: <your-namespace>
spec:
  parentRefs:
  - name: <your-namespace>
  hostnames:
  - "<your-namespace>.gateway.usu.trygoo.gl"
  rules:
  - matches:
    - path:
        type: PathPrefix
        value: /
    backendRefs:
    - name: ???
      port: ???