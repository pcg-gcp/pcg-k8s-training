apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: http-ingress
spec:
  rules:
  - host: "34.107.178.137.nip.io"
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: <internalservicename>
            port:
              number: 80
