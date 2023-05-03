# Create a DeamonSets

We have to create a check to ensure everyone or at least every node in our cluster can reach publiccloudgroup.com

- Use the template in the pod.yaml as a template for pod to be rolled out on all nodes.

- Ensure the daemonset was created successfully and it has as many pods as we have nodes in the cluster.

- Check the logs of at least one pod to ensure our checks are successful.

If you need any help check out the [documentation](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/).
