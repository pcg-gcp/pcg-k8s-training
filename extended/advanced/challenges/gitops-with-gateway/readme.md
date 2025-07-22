# GitOps and Gateway Migration Challenge

## Goal

Deploy an application using a GitOps workflow, initially exposing it with a
-traditional Ingress, and then migrate its traffic management to the modern
Gateway API.

## Your Task

1. **Set up the environment:** Install Argo CD and Traefik.

    **Install Argo CD:**

    ```bash
    helm repo add argo https://argoproj.github.io/argo-helm
    helm repo update
    helm install argocd argo/argo-cd -n argocd --create-namespace \
      -f values.yaml
    ```

    **Access Argo CD UI:**

    ```bash
    # Port-forward the Argo CD server to your local machine
    kubectl port-forward svc/argocd-server -n argocd 8080:80
    ```

    Access the UI at `http://localhost:8080`.

    **Get the initial admin password:**

    ```bash
    kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
    ```

    Log in to the Argo CD UI with the username `admin` and the password you
    just retrieved.

    **Install Traefik (as Ingress Controller initially):**

    ```bash
    helm repo add traefik https://helm.traefik.io/traefik
    helm repo update
    helm install traefik traefik/traefik -n traefik --create-namespace \
      --set providers.kubernetesGateway.enabled=true
    ```

    **Run Minikube Tunnel:**

    ```bash
    minikube tunnel
    ```

    Keep this command running in a separate terminal.

2. **Deploy the app with Ingress:** Apply the `workshop-challenge.yaml` to
    have Argo CD deploy the application from the `hello-world-app`
    directory. At this stage, it uses a standard `ingress.yaml`.

3. **Configure Hostname Resolution:** To access the application using its
    hostname, you must map the hostname to the IP address of the Traefik
    LoadBalancer service. This IP will be available after `minikube tunnel`
    is running.

    ```bash
    # Get the LoadBalancer IP for Traefik
    TRAEFIK_IP=$(kubectl get svc -n traefik traefik -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

    # Add to /etc/hosts
    echo "${TRAEFIK_IP} hello-world.local" | sudo tee -a /etc/hosts
    ```

4. **Verify initial deployment:** Ensure the application is running and
    accessible via the Ingress at `http://hello-world.local`.

5. **Migrate to Gateway API:**
    * Delete the existing `ingress.yaml`.
    * Create and apply a new `Gateway` resource to define the traffic
        entry point.
    * Create and apply a new `HTTPRoute` resource to route traffic from
        the `Gateway` to the `hello-world` service.

6. **Verify final state:** Confirm that the application is still accessible
    at `http://hello-world.local`, but is now being served through the
    Gateway API.

## Helpful Resources

* [Argo CD Documentation](https://argo-cd.readthedocs.io/en/stable/)
* [Traefik Gateway API Provider](https://doc.traefik.io/traefik/providers/kubernetes-gateway/)
* [Kubernetes Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)
* [Kubernetes Gateway API](https://gateway-api.sigs.k8s.io/)
