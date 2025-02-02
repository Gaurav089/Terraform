# ==============================================================================
#                            ✨ For Provider ✨
# ==============================================================================

variable "aws_profile" {
  description = "AWS profile to use"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

# ==============================================================================
#                               ✨ For VPC ✨
# ==============================================================================

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR Block fo Public Subnet"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR Block fo Private Subnet"
  type        = list(string)
}

variable "public_rt_destination_cidr_block" {
  description = "Public RT Destination Route"
  type        = string
}

variable "private_rt_destination_cidr_block" {
  description = "Privat blic RT Destination Route"
  type        = string
}

variable "vpc_security_group_name" {
  description = "Name for the security group"
  type        = string
}

variable "vpc_security_group_description" {
  description = "Description for the security group"
  type        = string
}

variable "vpc_security_group_ingress_cidr_blocks" {
  description = "CIDR blocks for security group ingress rules"
  type        = list(string)
}

# ==============================================================================
#                            ✨ For IAM Policy ✨
# ==============================================================================

variable "eks_cluster_role_name" {
  type = string
}

variable "eks_node_group_name" {
  type = string
}

# ==============================================================================
#                              ✨ For EKS-SG ✨
# ==============================================================================

variable "eks_security_group_name" {
  description = "Name for the security group"
  type        = string
}

variable "eks_security_group_description" {
  description = "Description for the security group"
  type        = string
}

variable "eks_security_group_ingress_cidr_blocks" {
  description = "CIDR blocks for security group ingress rules"
  type        = list(string)
}

# ==============================================================================
#                                ✨ FOR EKS ✨
# ==============================================================================

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

# ==============================================================================
#                           ✨ FOR Node Group ✨
# ==============================================================================

variable "node_group_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "capacity_type" {
  description = "Type of capacity"
  type        = string
}

variable "disk_size" {
  description = "Size of the disk"
  type        = number
}

variable "instance_types" {
  description = "List of instance types"
  type        = list(string)
}

variable "scaling_config" {
  description = "Scaling configuration"
  type = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
}

variable "update_config" {
  description = "Update configuration"
  type = object({
    max_unavailable = number
  })
}

# ==============================================================================
#                            ✨ EKS-AddOn ✨
# ==============================================================================

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

variable "aws_ebs_csi_driver" {
  type = string
}

variable "eks_addOn_vpc-cni_version" {
  description = "Version for the VPC CNI add-on"
}

variable "eks_addOn_kube-proxy_version" {
  description = "Version for the Kube Proxy add-on"
}

variable "eks_addOn_eks-pod-identity-agent_version" {
  description = "Version for the EKS Pod Identity Agent add-on"
}

variable "eks_addOn_coredns_version" {
  description = "Version for the CoreDNS add-on"
}


variable "eks_addOn_aws-ebs-csi-driver_version" {
  description = "Version for the AWS EBS CSI Driver add-on"
  type        = string
}