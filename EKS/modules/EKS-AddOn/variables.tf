# ==============================================================================
#                                ✨ Variables: Name ✨
# ==============================================================================

variable "cluster_name" {
  type = string
}

variable "eks_addOn_vpc-cni" {
  type = string
}

variable "eks_addOn_kube-proxy" {
  type = string
}

variable "eks_addOn_eks-pod-identity-agent" {
  type = string
}

variable "eks_addOn_coredns" {
  type = string
}

variable "eks_addOn_aws-ebs-csi-driver" {
  type = string
}

# ==============================================================================
#                              ✨ Variables: Version ✨
# ==============================================================================

variable "eks_addOn_vpc-cni_version" {
  description = "Version for the VPC CNI add-on"
  type        = string
}

variable "eks_addOn_kube-proxy_version" {
  description = "Version for the Kube Proxy add-on"
  type        = string
}

variable "eks_addOn_eks-pod-identity-agent_version" {
  description = "Version for the EKS Pod Identity Agent add-on"
  type        = string
}

variable "eks_addOn_coredns_version" {
  description = "Version for the CoreDNS add-on"
  type        = string
}

variable "eks_addOn_aws-ebs-csi-driver_version" {
  description = "Version for the AWS EBS CSI Driver add-on"
  type        = string
}
