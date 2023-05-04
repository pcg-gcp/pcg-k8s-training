# Deploy Jenkins via Kustomize

- Deploy Jenkins with the env environment
  
  ```cd kustomize-example && kubectl apply -k environments/dev```

- Deploy Jenkins with the prod environment

  ```cd kustomize-example && kubectl apply -k environments/prod```

- Make changes in the deployment and redeploy the application

  ```
  # example change in environments/prod/deployment.yml
  replicas: 3 #replica count changed
  selector:
    matchLabels:
      app: jenkins
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      containers:
      - name: jenkins
        image: jenkins/jenkins:lts
        ports:
          - name: http-port
            containerPort: 8000 #port changed
    ...
  ```
  ```cd kustomize-example && kubectl apply -k environments/prod```