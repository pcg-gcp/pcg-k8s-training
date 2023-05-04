# Set Request and Limits

- Deploy the deployment.yaml to create our caddy deployment again.

- Check the quality of qervice (QoS) class of one of the pods for this deployment.

- Ensure that the caddy container of the deployment gets at least 200m CPU and 128Mi RAM. Also ensure it does not use more than 128Mi RAM and 500m CPU.

- Check the quality of qervice (QoS) class of one of the pods again.

- Solemnly swear you will never create a pod without resources constraints ever again.

If you need any help check out the [documentation](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/).
