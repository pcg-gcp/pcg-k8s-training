# Create a Deployment with HPA

- Use the deployment we have previously created in section 11 as tmp and deploy it

- Modify this deployment and add a Horizontal Pod Autoscaler (HPA)

- As an example: Try to config a HPA, which reacts on an average CPU-utilization of 20 %

- Otherwise adjust your config and try diffrent kind of settings

- Check if the HPA was created succesfully

- Test your scaling config by exposing the deployment and adding load to your service

If you need any help check out the [documentation](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/).
