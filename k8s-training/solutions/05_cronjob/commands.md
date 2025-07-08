# Create a CronJob

- Deploy your cronjob

  ```kubectl apply -f cronjob.yaml```

- Check the status of the cronjob

  ```kubectl get cronjobs```

  ```kubectl get jobs --watch```

- Make sure that the output is correct
  
  ```kubectl get pods --selector=job-name=<jobname>```

  ```kubectl logs <podname>```
