# Create a CD-Pipeline with ArgoCD

- Install with the [commands](https://argo-cd.readthedocs.io/en/stable/operator-manual/installation/) provided in the documentation or by install the [Helm chart](https://artifacthub.io/packages/helm/argo/argo-cd) on your cluster
- If your are using the GKE cluster ArgoCD is already installed. You can use ArgoCD which is running in the argocd namespace. The default login is `admin:test123`
- Make sure you can access the ArgoCD UI via port-forwarding
