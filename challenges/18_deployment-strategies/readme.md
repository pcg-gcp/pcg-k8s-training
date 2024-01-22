# Deployment Update Strategies

- Deploy the provided application to your K8s cluster. Exchange the placeholders with appropriate values
- When you are using Minikube you can use [nip.io](https://nip.io) to get a wildcard DNS resolver for your local IP address
- Open a browser window on the URL you used in the ingress definition
- Change the color tag of the image in the deployment to another color `image: argoproj/rollouts-demo:green`. And run `kubectl apply -f .` (feasbile values are red, green, blue, yellow)
- Monitor your opend browser window
- Change the update strategy to `RollingUpdate` in the deployment and redeploy the application
- Set MaxSurge and MaxUnavailable attributes and oberserve how the update process is impacted
- Install argo-rollouts in the K8s cluster and the argo-rollouts plugin to your local machine. You can follow the [documentation](https://argoproj.github.io/argo-rollouts/getting-started/)
- Remove the deployment.yaml from the cluster
- Create a rollout.yaml defintion where you create a canary rollout using argo-rollouts [documentation](https://argoproj.github.io/argo-rollouts/getting-started/)
- Bonus: Create an Blue/Green rollout [documentation](https://argoproj.github.io/argo-rollouts/features/bluegreen/)