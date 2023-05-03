# Basic Kubectl Commands

- How many nodes does the cluster have?

  ```kubectl get nodes | wc -l```
- What namespaces are there?

  ```kubectl get namespaces```
- Which pods run in the "kube-system" namespace?
  
  ```kubectl get pods -n kube-system```
- Which pods are running on one of the nodes?

  ```kubectl get nodes```

  ```kubectl describe node <nodename>```
- What is in the logs from kube-dns or any other pod? (kube-dns is running the kube-system namespace)

  ```kubectl get pods -n kube-system```
  
  ```kubectl logs -n kube-system <podname>```
