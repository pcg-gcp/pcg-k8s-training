# Expose Deployment as Load Balancer

- Deploy the deployment.yaml to create our caddy deployment again.

- Expose the deployment internally by deploying a service of type ClusterIP.

- Expose the deployment externally by creating an ingress that is using a cert-manager issued certificate.

- Check the status of your certificate by using the command `kubectl get certificates`

- When the certificate is ready, check you can reach the deployment at the hostname you have specified.

If you need any help check out the documentation for [services](https://kubernetes.io/docs/concepts/services-networking/service), [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) and [ingress-nginx](https://kubernetes.github.io/ingress-nginx/user-guide/tls/#automated-certificate-management-with-cert-manager) .
