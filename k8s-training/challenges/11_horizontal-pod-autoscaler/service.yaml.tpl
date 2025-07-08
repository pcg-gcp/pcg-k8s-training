apiVersion: v1
kind: Service
metadata:
  name: demo-service-hpa
  namespace: <your-namespace>
spec:
  ports:
  - port: 80
    targetPort: 80
  selector:
    app: ???