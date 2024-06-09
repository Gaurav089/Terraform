# ==============================================================================
#            ✨ Fetch Policy for EKS Cluster: AmazonEKSClusterPolicy ✨
# ==============================================================================

data "aws_iam_policy" "AmazonEKSClusterPolicy" {
  name = "AmazonEKSClusterPolicy"
}

# ==============================================================================
#   ✨ Fetch Policy for EKS Cluster Node Group: AmazonEKSWorkerNodePolicy ✨
# ==============================================================================

data "aws_iam_policy" "AmazonEKSWorkerNodePolicy" {
  name = "AmazonEKSWorkerNodePolicy"
}

# ==============================================================================
#     ✨ Fetch Policy for EKS Cluster Node Group: AmazonEKS_CNI_Policy ✨
# ==============================================================================

data "aws_iam_policy" "AmazonEKS_CNI_Policy" {
  name = "AmazonEKS_CNI_Policy"
}

# ===============================================================================
#✨ Fetch Policy for EKS Cluster Node Group: AmazonEC2ContainerRegistryReadOnly ✨
# ===============================================================================

data "aws_iam_policy" "AmazonEC2ContainerRegistryReadOnly" {
  name = "AmazonEC2ContainerRegistryReadOnly"
}

# ==============================================================================
#   ✨ Fetch Policy for EKS Cluster Node Group: CloudWatchLogsFullAccess ✨
# ==============================================================================

data "aws_iam_policy" "CloudWatchLogsFullAccess" {
  name = "CloudWatchLogsFullAccess"
}

# ==============================================================================
#    ✨ Fetch Policy for EKS Cluster Node Group: AmazonEBSCSIDriverPolicy ✨
# ==============================================================================

data "aws_iam_policy" "AmazonEBSCSIDriverPolicy" {
  name = "AmazonEBSCSIDriverPolicy"
}
