# K8s Service Accounts
- Create a namespace using kubectl
  
  ```kubectl create namespace accounting``

- Create a Kubernetes Service Account in the namespace using kubectl

  ```kubectl create serviceaccount <accounting-sa> --namespace accounting```

- Use the Service Account with a Pod 

  ```kubectl apply -f pod-sa.yaml```

- Mount a Kubernetes service account token into a Pod 

  ```kubectl apply -f pod-sa-token.yaml```

- Verify the pod is running

  ```kubectl get pods -ns <accounting>```


