# Set Request and Limits

- Rewrite the YAML files from *01_pod-creation* and *02_deployment-creation* 

- For this taks use the yaml files in the current directory as templates and make sure you define a request and a limit for workload safety

- Update your pods and make sure your values got changed. Afterwards try and use different values.

- Use the following parameters:
```
Requests: 
    Cpu: 200m
Limit:
    Cpu: 500m
    Memory: 128Mi
```