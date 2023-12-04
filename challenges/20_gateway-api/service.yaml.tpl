apiVersion: v1
kind: Service
metadata:
  name: demo-service
  namespace: <your-namespace>
spec:
  ports:
  - port: 80
    targetPort: 8080
    protocol: TCP
    name: http
  selector:
    app: demo