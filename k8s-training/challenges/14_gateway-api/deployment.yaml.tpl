apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-deployment
  namespace: <your-namespace>
spec:
  replicas: 2
  selector:
    matchLabels:
      app: demo
  template:
    metadata:
      labels:
        app: demo
    spec:
      containers:
      - name: demo-container
        image: nginxdemos/nginx-hello:plain-text
        ports:
        - containerPort: 8080