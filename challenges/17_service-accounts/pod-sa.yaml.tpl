apiVersion: v1
kind: Pod
metadata:
  name: ???
  namespace: ???
spec:
  serviceAccountName: ???
  containers:
  - name: caddy
    image: caddy:2.6.4
    ports:
    - containerPort: 80
