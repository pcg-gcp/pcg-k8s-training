# Config a Deployment with HPA

- Deploy the HPA.

  ```kubectl apply -f hpa.yaml```

- Option B: Adding a HPA by using the cli

  ```kubectl autoscale deployment caddy --cpu-percent=20 --min=1 --max=10```

- Check hpa status.

  ```kubectl get hpa```

- Add load to the service

  ```while true; do```
  ```curl http://your-service-ip:your-service-port```
  ```done```

