# Setup a Nginx Fabric Gateway to handle Ingress Traffic to your cluster

- When you are using Minikube then install the Nginx Gateway API as described in the [documentation](https://docs.nginx.com/nginx-gateway-fabric/installation/installing-ngf/manifests/) (This step can be skipped if you're using GKE)
- When using a GKE Cluster, ensure that the Gateway API is activated as described in the [documentation](https://cloud.google.com/kubernetes-engine/docs/how-to/deploying-gateways#enable-gateway)
- Deploy the provided deployment and service to your namespace on the cluster
- Create a Gateway resource of type nginx or a GKE native Gateway and a HTTPRoute resource to route traffic to your newly created service
- Adjust the in the template provided url with your namespace or use a wildcard domain from [nip.io](https://nip.io)
- Check if your deployment is exposed correctly and reachable from your web browser


**Bonus challenge**
- Create a second deployment in your namespace or a secondary namespace and a corresponding service e.g. you can use one of the [demo deployments provided by ArgoCD](https://github.com/argoproj/argocd-example-apps/tree/master/guestbook)
- Adopt your HTTPRoute resource to distribute the traffic evenly to your newly create and the the existing deployment.
- Check with your web browser if the weighted routing works as expected.

## Documentation and other helpful resources
- If you need any help check out the documentation for [Gateway API](https://gateway-api.sigs.k8s.io/) in general and the [Nginx Fabric Gateway](https://docs.nginx.com/nginx-gateway-fabric/how-to/traffic-management/routing-traffic-to-your-app/).
- [Kubernetes Documentation for Gateway API](https://kubernetes.io/docs/concepts/services-networking/gateway/) also shows helpful flow diagrams.
- If you use a GKE Cluster also check the Google documentation about how to [Deploy Gateway resources](https://cloud.google.com/kubernetes-engine/docs/how-to/deploying-gateways)