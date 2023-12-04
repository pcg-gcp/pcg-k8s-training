terraform {
  backend "gcs" {
    bucket = "usu-k8s-demo-state-files"
    prefix = "usu-schulung"
  }
}