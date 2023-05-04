apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: https-ingress
  annotations:
    cert-manager.io/cluster-issuer: "letsencrypt"
spec:
  ingressClassName: nginx
  tls:
  - hosts:
      - <yourname>.k8s.trygoo.gl
    secretName: ingress-tls
  rules:
  - host: <yourname>.k8s.trygoo.gl
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: <internalservicename>
            port:
              number: 80
