# ==============================================================================
#                             ✨ Add-on: vpc-cni ✨
# ==============================================================================

resource "aws_eks_addon" "vpc-cni" {
  cluster_name    = var.cluster_name
  addon_name      = var.eks_addOn_vpc-cni
  addon_version   = var.eks_addOn_vpc-cni_version
}

# ==============================================================================
#                            ✨ Add-on: kube-proxy ✨
# ==============================================================================

resource "aws_eks_addon" "kube-proxy" {
  cluster_name    = var.cluster_name
  addon_name      = var.eks_addOn_kube-proxy
  addon_version   = var.eks_addOn_kube-proxy_version
}

# ==============================================================================
#                   ✨ Add-on: eks-pod-identity-agent ✨
# ==============================================================================

resource "aws_eks_addon" "eks-pod-identity-agent" {
  cluster_name    = var.cluster_name
  addon_name      = var.eks_addOn_eks-pod-identity-agent
  addon_version   = var.eks_addOn_eks-pod-identity-agent_version
}

# ==============================================================================
#                           ✨ Add-on: coredns ✨
# ==============================================================================

resource "aws_eks_addon" "coredns" {
  cluster_name    = var.cluster_name
  addon_name      = var.eks_addOn_coredns
  addon_version   = var.eks_addOn_coredns_version
}

# ==============================================================================
#                       ✨ Add-on: EBS Drive ✨
# ==============================================================================

resource "aws_eks_addon" "aws-ebs-csi-driver" {
  cluster_name    = var.cluster_name
  addon_name      = var.eks_addOn_aws-ebs-csi-driver
  addon_version   = var.eks_addOn_aws-ebs-csi-driver_version
}
