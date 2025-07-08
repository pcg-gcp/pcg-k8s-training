# Using RBAC 

- Deploy the role.yaml to create a Role that has read access to all pods in your namespace.

- Use the Role within the role-binding.yaml .

- Assign the Role to a User, Kubernetes Service Account

- When working on GKE you can also assign roles to IAM Service Accounts and a Goolge Group

- Check the Bindings using `kubectl auth can-i [task] --namespace [namespace_name] --as [name of the user,group,sa]`


If you need any help check out the documentation for [api-access](https://kubernetes.io/docs/reference/access-authn-authz/authorization/#checking-api-access) and [rbac](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) .
