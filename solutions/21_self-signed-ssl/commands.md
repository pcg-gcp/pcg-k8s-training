```openssl genrsa -out ca.key 2048```

```
openssl req -x509 -new -nodes -key ca.key -sha256 -subj "/CN=marius.k8s.usu.trygoo.gl" -days 1024 -out ca.crt -extensions san -config <(
echo '[req]';
echo 'distinguished_name=req';
echo '[san]';
echo 'subjectAltName=DNS:marius.k8s.usu.trygoo.gl')
```

```
kubectl create secret tls ingress-local-tls \
  --cert=ca.crt \
  --key=ca.key -n mariusbu
```