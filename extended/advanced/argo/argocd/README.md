## 1. Add the Argo Helm Chart

```
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
```


## 2. Install Argo CD via Helm

```
helm install argocd argo/argo-cd -n argocd -f values.yaml --create-namespace
```

- This creates the `argocd` namespace and deploys Argo CD.


## 3. Access the Argo CD Web UI

```
minikube service -n argocd argocd-server --url
```

- This command will give you a **URL** to access the Argo CD dashboard in your browser.


## 4. Get the Argo CD Admin Password

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

- Use **username:** `admin`
- Use **password:** the value output by the command above


## 5. Deploy the Workshop Challenge App

```
kubectl apply -f workshop-challenge.yaml
```

- This applies the Argo CD Application and challenge AppProject to your cluster.


## 6. Test the Challenge Deployment

After fixing the AppProject as per the workshop, confirm your deployed app is accessible:

```
minikube service -n hello-world nginx --url
```