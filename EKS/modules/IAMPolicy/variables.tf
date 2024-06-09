# ==============================================================================
#                      ✨ EKS Cluster Role Variables ✨
# ==============================================================================

variable "eks_cluster_role_name" {
  description = "EKS Cluster Role Name"
  type        = string
}

# ==============================================================================
#                    ✨ EKS Node Group Role Variables ✨
# ==============================================================================

variable "eks_node_group_name" {
  description = "EKS Node Group Role Name"
  type        = string
}
