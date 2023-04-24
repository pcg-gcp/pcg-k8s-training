Kubectl command to create a namespace:
kubectl create namespace <insert-namespace-name-here> 

Kubectl command to setup the new namespace as your default namespace:
kubectl config set-context --current --namespace <namespace>