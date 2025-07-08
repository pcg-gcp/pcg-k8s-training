apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: ???
  namespace: <your-namespace>
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: ???
  minReplicas: ???
  maxReplicas: ???
  metrics:
  - ???