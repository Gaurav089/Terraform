# ==============================================================================
#                     ✨ Provider Configuration ✨
# ==============================================================================

provider "aws" {
  profile = var.aws_profile  # Fetches AWS access keys and secret key from the AWS profile defined in the ".aws" directory
  region  = var.aws_region   # Specifies the AWS region to use for resources
}

provider "helm" {
  kubernetes {
    host                   = module.EKS.cluster_endpoint
    cluster_ca_certificate = module.EKS.cluster_ca_certificate

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.EKS.cluster_id]
      command     = "aws"
    }
  }
}
