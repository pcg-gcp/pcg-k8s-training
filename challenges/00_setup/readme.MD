# Setup your environment

- Make sure you installed gcloud on your local machine. For further information click on the following link: [gcloud installation](https://cloud.google.com/sdk/docs/install?hl=de#deb)

- Check with ```gcloud components list``` if the following components are installed: *kubectl* and *gke-gcloud-auth-plugin*.

- Otherwise install it with ```gcloud components install <components-name>```.

- After confirmation that both components are installed, make sure you connect with your google account: ```gcloud auth login```

- To start working with the kubernetes cluster you need to connect to the kubernetes cluster: ```gcloud container clusters get-credentials <cluster-name> --region <cluster-region> --project <project-id>```

- Before performing any operations on the cluster switch to your namespace: ```kubectl config set-context --current --namespace=<namespace-name>```
