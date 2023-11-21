# Create a CD-Pipeline with ArgoCD

- Install with the [commands](https://argo-cd.readthedocs.io/en/stable/operator-manual/installation/) provided in the documentation or by install the [Helm chart](https://artifacthub.io/packages/helm/argo/argo-cd) on your cluster
- If your are using the GKE cluster ArgoCD is already installed. You can use ArgoCD which is running in the argocd namespace. The default login is `admin:k8sschulung2023`
- Make sure you can access the ArgoCD UI via port-forwarding `kubectl port-forward svc/argocd-server -n argocd 8080:443`
- Adjust the URL and the namespace in the [K8s deployment](./app/) in this directory
- Create a `application.yaml` for the adjusted [K8s deployment](./app/) so that ArgoCD manages this deployment
- Create a branch, make changes to the application and commit this changes. Change the application.yaml so that ArgoCD is managing the app from the new brnach. Check if the changes get to the cluster by Argo.
- Create a second deployment by using the ArgoCD UI