Rewrite the YAML files from 01_pod-creation and 02_deployment-creation 

Use the Yaml from the task above as templates and make sure you define a request and a limit for workload safety

Use the following parameters:
Requests: 
    Cpu: 200m
Limit:
    Cpu: 500m
    Memory: 128Mi

Update your pods and make sure your values got changed. Afterwards try and use different values.
