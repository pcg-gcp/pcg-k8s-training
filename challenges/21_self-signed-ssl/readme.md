# Create a self signed SSL cert and use it with your Ingress controller

- Create a CA to sign your certificate ```openssl genrsa -out ca.key 2048```
- Create a self signed SSL cert with openssl, you can use the follwing command (replace the url and dns entry with your custom domain or a nip.io wildcard DNS):
```
openssl req -x509 -new -nodes -key ca.key -sha256 -subj "/CN=marius.k8s.usu.trygoo.gl" -days 1024 -out ca.crt -extensions san -config <(
echo '[req]';
echo 'distinguished_name=req';
echo '[san]';
echo 'subjectAltName=DNS:marius.k8s.usu.trygoo.gl')
```

- Create a K8s secret of type tls with your `ca.crt` and `ca.key`.
- Now you can reference your tls secret in the tls section of the provided [ingress.yaml](./ingress.yaml)
- Deploy all provied resource in this challenges

If you need help, you can use the [documentation](https://kubernetes.io/docs/concepts/configuration/secret/#tls-secrets)