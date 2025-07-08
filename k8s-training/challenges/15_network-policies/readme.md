# Protect your Deployment/Pods by using Kubernetes network policies

- If your working on Minikube make sure that Network Policies are supported and the selected CNI is Calico. For a description on how to enable it pleas follow the [Minikube documentation](https://minikube.sigs.k8s.io/docs/handbook/network_policy/)
- Create a basic Nginx Deployment in your namespace that exposes a endpoint via ClusterIP service
- Create a simple Ubuntu Pod in your namespace. With that pod you can test the connectivity to your deployment by running `kubectl exec <pod-name> -n <your-namespace> -- curl <service>.<your-namespace>.svc.cluster.local`
- Create a Kubernetes Network Policies that ensures that you Nginx Deplyoment is only reachable from your namespace and from Pods with the correct labels
- Change the label of the Linux Pod to test the Network Policy
- Limit the egress of you namespace to a specific IP range and test the connectivity with the Linux Pod (e.g. )
- After you finished the challenge make sure to delete all created Network Policies again to avoid networking issues later

If you need any help check out the [K8s documentation](https://kubernetes.io/docs/concepts/services-networking/network-policies/).