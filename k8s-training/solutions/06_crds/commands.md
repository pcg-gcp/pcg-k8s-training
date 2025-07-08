# Using CustomResourceDefinitions

- Deploy the CRD

  ```kubectl apply -f crontab_crd.yaml```

- Deploy the crontab

  ```kubectl apply -f crontab.yaml```

- Check if the crontab was created successfully

  ```kubectl get crontabs```
