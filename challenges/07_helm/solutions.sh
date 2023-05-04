# add jenkins helm repo to your local helm installations
helm repo add jenkins https://charts.jenkins.io

#update local helm repos
helm repo update

helm install jenkins jenkins/jenkins -n jenkins --create-namespace

# exec into the jenkins pod and echo the default admin password
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo

# set up a port-forwarding for the jenkins service to make the UI reachable from your machine
kubectl --namespace jenkins port-forward svc/jenkins 8080:8080

# open the UI in your browser by visiting https://localhost:8080 and enter admin and the retrived password
curl http://localhost:8080

# upgrade your helm deployment with the following values, either set them directly in the command or update the values.yml
#Option 1
helm upgrade jenkins jenkins/jenkins --set controller.serviceType=LoadBalancer --set=controller.servicePort=80 -n jenkins

# Option 2
helm upgrade jenkins jenkins/jenkins -f values.yml -n jenkins



