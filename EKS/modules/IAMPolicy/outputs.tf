# ==============================================================================
#                     ✨ Export EKS Cluster Service Role ARN ✨
# ==============================================================================

output "eks_cluster_service_role_ARN" {
  value = aws_iam_role.EksClusterServiceRole.arn
}

# ==============================================================================
#                   ✨ Export AmazonEKSClusterPolicy ARN ✨
# ==============================================================================

output "AmazonEKSClusterPolicy_ARN" {
  value = aws_iam_role_policy_attachment.AmazonEKSClusterPolicy.policy_arn
}

# ==============================================================================
#                      ✨ Export EKS Node Role ARN ✨
# ==============================================================================

output "eks_node_role_ARN" {
  value = aws_iam_role.AmazonEKSNodeRole.arn
}

# ==============================================================================
#               ✨ Export AmazonEKSWorkerNodePolicy ARN ✨
# ==============================================================================

output "AmazonEKSWorkerNodePolicy_ARN" {
  value = aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy.policy_arn
}

# ==============================================================================
#                    ✨ Export AmazonEKS_CNI_Policy ARN ✨
# ==============================================================================

output "AmazonEKS_CNI_Policy_ARN" {
  value = aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy.policy_arn
}

# ==============================================================================
#             ✨ Export AmazonEC2ContainerRegistryReadOnly ARN ✨
# ==============================================================================

output "AmazonEC2ContainerRegistryReadOnly_ARN" {
  value = aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly.policy_arn
}

# ==============================================================================
#                   ✨ Export CloudWatchLogsFullAccess ARN ✨
# ==============================================================================

output "CloudWatchLogsFullAccess_ARN" {
  value = aws_iam_role_policy_attachment.CloudWatchLogsFullAccess.policy_arn
}

# ==============================================================================
#               ✨ Export AmazonEBSCSIDriverPolicy ARN ✨
# ==============================================================================

output "AmazonEBSCSIDriverPolicy_ARN" {
  value = aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy.policy_arn
}
