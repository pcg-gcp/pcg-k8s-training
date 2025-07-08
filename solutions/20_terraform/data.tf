data "google_compute_network" "cluster_vpc" {
  name = "k8s-vpc"
  project = "pcg-usu-k8s-schulung"
}

data "google_client_config" "provider" {}