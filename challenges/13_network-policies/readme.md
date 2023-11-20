# Protect your Deployment/Pods by using Kubernetes network policies

- Create a basic Nginx Deployment in your namespace that exposes a endpoint via ClusterIP service
- Create a simple Ubuntu Pod in your namespace. With that pod you can test the connectivity to your deployment by running `kubectl exec <pod-name> -n <your-namespace> -- curl <service>.<your-namespace>.svc.cluster.local`
- Create a Kubernetes Network Policies that ensures that you Nginx Deplyoment is only reachable from your namespace and from Pods with the correct labels
- Change the label of the Linux Pod to test the Network Policy
- Limit the egress of you namespace to a specific IP range and test the connectivity with the Linux Pod (e.g. )
- After you finished the challenge make sure to delete all created Network Policies again to avoid networking issues later