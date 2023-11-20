apiVersion: v1
kind: Pod
metadata:
  name: POD_NAME
  namespace: NAMESPACE_NAME
spec:
  containers:
  - image: CONTAINER_NAME
    name: CONTAINER_NAME
    volumeMounts:
    - mountPath: /var/run/secrets/tokens
      name: KSA_NAME_TOKEN
  serviceAccountName: KSA_NAME
  volumes:
  - name: KSA_NAME_TOKEN
    projected:
      sources:
      - serviceAccountToken:
          path: KSA_NAME_TOKEN
          expirationSeconds: 86400
          audience: some-oidc-audience