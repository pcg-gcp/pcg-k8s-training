# Create GCP infrastructure with Terraform
- Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on your local machine, or run the [Docker version](https://hub.docker.com/r/hashicorp/terraform). As an alternative you can run Terraform in the [GCP Cloudshell](https://shell.cloud.google.com) were TF is preinstalled 
- All resources should be deployed in the training GCP project
- Save your state file in the GCS bucket for terraform state, use your name as the prefix in the backend configuration

### Create the GCP following infrastructure

1. Deploy GKE cluster with the name `demo-cluster-<your-name>` that runs in the zone `europe-west1-c` with **2** nodes of type `e2-small`. This nodes should be preemtible (spot) nodes. The cluster should run the VPC with the name `k8s-vpc`. To retrieve the self_link of the VPC you can use the following code snippet:
```
data "google_compute_network" "cluster_vpc" {
  name = "k8s-vpc"
  project = "pcg-usu-k8s-schulung"
}
```
2. After the successful cluster creation add the Kubernetes and Helm provider to your configuration. The [Terraform documentation](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/guides/using_gke_with_terraform) may help you.
3. Create a namespace with your name in the new cluster via Terraform
4. Deploy the [Jenkins Helm chart](https://artifacthub.io/packages/helm/jenkinsci/jenkins) from artifacthub.io to the newly created cluster in the namespace you just created.
5. At the end of this challenge please run `terraform destory -auto-approve` to destroy all created resources during this challenge to save costs.