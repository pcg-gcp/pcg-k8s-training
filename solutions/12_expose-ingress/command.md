# Expose Deployment as Load Balancer

- Deploy the internal service.

  ```kubectl apply -f internal-service.yaml```

- Deploy the ingress.

  ```kubectl apply -f ingress.yaml```

- Check your certificate has reached the ready=true.

  ```kubectl get certificates```

- Use your browser to connect to hostname you have provided and https is used.
