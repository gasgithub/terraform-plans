### adding Stocktrader operator installation
data "ibm_container_cluster_config" "roks_cluster" {
  cluster_name_id = var.cluster_name
   admin           = true
}

# provider "kubernetes" {
#   host                   = data.ibm_container_cluster_config.roks_cluster.host
#   client_certificate     = data.ibm_container_cluster_config.roks_cluster.admin_certificate
#   client_key             = data.ibm_container_cluster_config.roks_cluster.admin_key
#   cluster_ca_certificate = data.ibm_container_cluster_config.roks_cluster.ca_certificate
# }

# resource "kubernetes_namespace" "stocktrader" {
#   metadata {
#     name = var.stocktrader_namespace
#   }
# }

provider "kubectl" {
  host                   = data.ibm_container_cluster_config.roks_cluster.host
  client_certificate     = data.ibm_container_cluster_config.roks_cluster.admin_certificate
  client_key             = data.ibm_container_cluster_config.roks_cluster.admin_key
  cluster_ca_certificate = data.ibm_container_cluster_config.roks_cluster.ca_certificate
#  token                  = data.ibm_container_cluster_config.roks_cluster.token
}
data "kubectl_file_documents" "manifests" {
    content = file("operator.yaml")
}
resource "kubectl_manifest" "operator-install" {
    count     = length(data.kubectl_file_documents.manifests.documents)
    yaml_body = element(data.kubectl_file_documents.manifests.documents, count.index)
}