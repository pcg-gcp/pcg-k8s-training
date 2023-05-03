# Create a CronJob

- Create a CronJob, which creates every minute a pod that echos the string "Hello from the Kubernetes Cluster"

- Confirm if the CronJob is created and running

- Make sure that the output is correct
  - First save the ouput of the pod in a variable
    ```pods=$(kubectl get pods --selector=job-name=<name of an job> --output=jsonpath={.items[*].metadata.name})```
  - Then watch the log of the pod
    ```kubectl logs $pods ```
