# Create a Deployment with HPA

- Use the deployment we have previously created in section 11 as tmp and deploy it in your namespace

- Modify this deployment and add a Horizontal Pod Autoscaler (HPA)

- As an example: Try to config a HPA, which reacts on an average CPU-utilization of 20 %

- Otherwise adjust your config and try diffrent kind of settings

- Check if the HPA was created succesfully

- Test your scaling config by exposing the deployment and adding load to your service

- You can create artificial load on your deployment with the pod defined in the [load-generator.yaml](./load-generator.yaml). Another possible solution is running ```kubectl port-forward``` call the service from your browser and spam F5.

If you need any help check out the [documentation](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/).
