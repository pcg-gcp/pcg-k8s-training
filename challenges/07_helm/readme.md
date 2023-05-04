# Using Helm charts and deploy an application

- Deploy the public available [Jenkins helm chart](https://artifacthub.io/packages/helm/jenkinsci/jenkins) in your K8s cluster in the namespace *jenkins*. You can follow the steps provided at the Artifacthub page

- Login into the jenkins pod to verify the successful deployment of the Helm chart (follow the introductions in the console output after the deployment to get the admin password)

- Upgrade your Helm deployment to expose the Jenkins application via a LoadBalancer under port 80 to the public internet

- Check if Jenkins is reachable with the IP of the LoadBalancer

If you need any help check out the [Helm documentation](https://helm.sh/docs/helm/helm_install/).