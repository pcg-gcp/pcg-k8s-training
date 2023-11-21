
# Change the image of the deployment/rollout resource
kubectl argo rollouts set image demo-app  demo-app=argoproj/rollouts-demo:yellow

# Promote the rollout
kubectl argo rollouts promote rollouts-demo