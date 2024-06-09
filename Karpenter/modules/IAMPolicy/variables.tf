# =======================================
#       ✨ EKS IAM Role Variables ✨
# =======================================

# EKS Cluster Role Name
variable "eks_cluster_role_name" {
  description = "Name of the IAM role for EKS cluster"
  type        = string
}

# EKS Node Group Role Name
variable "eks_node_group_name" {
  description = "Name of the IAM role for EKS node group"
  type        = string
}

# OIDC URL for Assume Role Policy
variable "oidc_url" {
  description = "OIDC URL used in the AssumeRolePolicyDocument"
  type        = string
}

# OIDC ARN for Assume Role Policy
variable "oidc_arn" {
  description = "OIDC ARN used in the AssumeRolePolicyDocument"
  type        = string
}
