# Create a DeamonSets

- Deploy the daemonset

  ```kubectl apply -f daemonset.yaml```

- Check if the DeamonSet was created successfully

  ```kubectl get daemonsets```

- Check if the package reaching their destination

  ```kubectl get pods```

  ```kubectl logs <podname>```
