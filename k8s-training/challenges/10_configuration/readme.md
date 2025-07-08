# Working with ConfigMaps and Persistent Volumes

We have a small backend that needs a bunch of configuration and a place to store its logs.
The app needs a config file called config.toml that logs like this:

```toml
name = "<Your Name>"
drink = "<Your Favorite Drink>"
```

It also needs a password for it's admin user provided in the environment variable ADMIN_PASSWORD.

Once the app is running you can access it using port forwarding:

```bash
kubectl port-forward pod/<podname> http
```

Once port forwarding is active you can reach it's two endpoints:

- unprivileged call

  ```curl localhost:8080```

- priveleged call

  ```curl -u "admin:<yourpassword>" localhost:8080/admin```

Two solve this challenge you have to complete the following steps:

- Create the admin-secret using kubectl
- Create a configmap using the template configmap.yaml.tpl by modifying the placeholder to whatever you want.
- Create a PersistentVolumeClaim that has capcity of 1 Gi
- Create the deployment using the template deployment.yaml.tpl. Make sure all questions marks are replaced properly.

If you need any help check out the documentation for [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/), [ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/) and [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/).
