resource "google_container_cluster" "cluster" {
  name           = "demo-cluster-marius"
  location       = var.target_region
  node_locations = ["${var.target_region}-c"]

  remove_default_node_pool = true
  initial_node_count       = 1

  network         = data.google_compute_network.cluster_vpc.self_link
  networking_mode = "VPC_NATIVE"

  addons_config {
    http_load_balancing {
      disabled = false
    }

    network_policy_config {
      disabled = false
    }
  }

  cluster_autoscaling {
    enabled = false
  }

}

resource "google_container_node_pool" "node_pool" {
  name       = "node-pool-marius"
  location   = var.target_region
  cluster    = google_container_cluster.schulungs_cluster.name
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "e2-small"
    disk_size_gb = 15
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  network_config {
    enable_private_nodes = true
  }
}
