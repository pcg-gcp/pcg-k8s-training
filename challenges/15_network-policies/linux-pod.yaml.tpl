apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-demo
  namespace: <your-namespace>
spec:
  containers:
  - name: ubuntu
    image: ubuntu:latest
    command: ["sleep", "infinity"]
    resources:
      requests:
        cpu: 100m
        memory: 128Mi
      limits:
        cpu: 100m
        memory: 128Mi