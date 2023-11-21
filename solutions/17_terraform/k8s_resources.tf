resource "kubernetes_namespace" "developer_ns" {

  metadata {
    name = "marius"
  }
}