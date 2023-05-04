# Working with ConfigMaps and Persistent Volumes

- Create the secret using kubectl
  
  ```kubectl create secret generic admin-secret --from-literal=password=<yourpassword>```

- Verify the content of the secret is correct

  ```kubectl get secret admin-secret -o jsonpath='{.data.password}' | base64 -d```

- Create the configmap and pvc using YAML files

  ```kubectl apply -f configmap.yaml```

  ```kubectl apply -f pvc.yaml```

- Verify the CpnfigMap and PVC were created successfully-

  ```kubectl get configmaps```

  ```kubectl get persistentvolumeclaims```

- Verify the content of the ConfigMap

  ```kubectl describe configmap config```

- Create the deployment

  ```kubectl apply -f deployment.yaml```

- Forward the pods http port to your local machine

  ```kubectl get pods```

  ```kubectl port-forward pod/<podname> http```

- Test the unprivileged call

  ```curl localhost:8080```

- Test the priveleged call

  ```curl -u "admin:supersecret" localhost:8080/admin```
