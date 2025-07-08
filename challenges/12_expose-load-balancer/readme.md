# Expose Deployment as Load Balancer

- Deploy the deployment.yaml to create our caddy deployment again.

- Expose the deployment using a Service of type LoadBalancer. When using Minikube it might be possible that you need to enable the load balancer capabilities. YOu can follow the [documentation](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/) to enable it.

- Check you can reach the deployment at the external IP of the service.

If you need any help check out the [documentation](https://kubernetes.io/docs/concepts/services-networking/service).
