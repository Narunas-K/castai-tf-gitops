# Creates Cluster resource on CAST AI backend.
# Returns:
# - cluster_token - set 'castai.apiKey' ENV for castai-agent, cluster-controller and castai-kvisor Helm release to be able to authenticate to CAST AI backend.
# - id    - set:
#                       'additionalEnv.STATIC_CLUSTER_ID' ENV for castai-agent Helm release.
#                       'castai.clusterID' ENV for cluster-controller, castai-spot-handler, castai-kvisor Helm releases.
#
resource "castai_eks_cluster" "my_castai_cluster" {
  account_id = var.aws_account_id
  region     = var.aws_cluster_region
  name       = var.aws_cluster_name

  delete_nodes_on_disconnect = var.delete_nodes_on_disconnect
  assume_role_arn            = var.aws_assume_role_arn
}

resource "castai_node_configuration" "default" {
  cluster_id        = castai_eks_cluster.my_castai_cluster.id
  name              = "default"
  disk_cpu_ratio    = 0
  min_disk_size     = 100
  subnets           = var.subnets
  eks {
    security_groups      = var.security_groups
    instance_profile_arn = var.instance_profile
  }
}

resource "castai_node_configuration_default" "this" {
  cluster_id       = castai_eks_cluster.my_castai_cluster.id
  configuration_id = castai_node_configuration.default.id
}