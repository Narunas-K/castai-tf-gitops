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
}