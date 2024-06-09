# ==============================================================================
#                                ✨ terraform ✨
# ==============================================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"  # Specifies the source of the AWS provider
      version = "~> 3.27"        # Specifies the version of the AWS provider to be used
    }
  }

  required_version = ">= 0.14.9"  # Specifies the required Terraform version
}

# ==============================================================================
#                                  ✨ VPC Module ✨
# ==============================================================================

module "VPC" {
  source = "./modules/VPC"  # Specifies the source path for the VPC module

  vpc_cidr                           = var.vpc_cidr  # CIDR block for the VPC
  public_subnet_cidrs                = var.public_subnet_cidrs  # CIDR blocks for public subnets
  private_subnet_cidrs               = var.private_subnet_cidrs  # CIDR blocks for private subnets
  public_rt_destination_cidr_block   = var.public_rt_destination_cidr_block  # Destination CIDR block for public route table
  private_rt_destination_cidr_block  = var.private_rt_destination_cidr_block  # Destination CIDR block for private route table
  security_group_name                = var.vpc_security_group_name  # Name for the VPC security group
  security_group_description         = var.vpc_security_group_description  # Description for the VPC security group
  security_group_ingress_cidr_blocks = var.vpc_security_group_ingress_cidr_blocks  # Ingress CIDR blocks for the VPC security group
}

# ==============================================================================
#                              ✨ IAM Policy Module ✨
# ==============================================================================

module "IAMPolicy" {
  source = "./modules/IAMPolicy"  # Specifies the source path for the IAM Policy module
  oidc_arn = module.EKS.oidc_arn
  oidc_url = module.EKS.oidc_url
  eks_cluster_role_name = var.eks_cluster_role_name  # Role name for the EKS cluster
  eks_node_group_name   = var.eks_node_group_name  # Name for the EKS node group
}

# ==============================================================================
#                                  ✨ EKS Module ✨
# ==============================================================================

module "EKS" {
  source = "./modules/EKS"  # Specifies the source path for the EKS module

  security_group_name                = var.eks_security_group_name  # Name for the EKS security group
  security_group_description         = var.eks_security_group_description  # Description for the EKS security group
  vpc_id                             = module.VPC.vpc_id  # VPC ID from the VPC module
  security_group_ingress_cidr_blocks = var.eks_security_group_ingress_cidr_blocks  # Ingress CIDR blocks for the EKS security group
  cluster_name                       = var.cluster_name  # Name for the EKS cluster
  subnet_ids                         = [module.VPC.vpc_subnet_id_1, module.VPC.vpc_subnet_id_2]  # Subnet IDs for the EKS cluster
  eks_Cluster_role_Arn               = module.IAMPolicy.eks_cluster_service_role_ARN  # ARN of the EKS cluster service role from the IAM Policy module
  eks_depends_on                     = [module.VPC.vpc_id, module.IAMPolicy.AmazonEKSClusterPolicy_ARN]  # Dependencies for the EKS cluster
}

# ==============================================================================
#                          ✨ EKS Node Group Module ✨
# ==============================================================================

module "EKS-NG" {
  source = "./modules/NG"  # Specifies the source path for the EKS Node Group module

  cluster_name          = module.EKS.cluster_name  # Cluster name from the EKS module
  node_group_name       = var.node_group_name  # Name for the EKS node group
  eks_node_grp_role_Arn = module.IAMPolicy.eks_node_role_ARN  # ARN of the EKS node role from the IAM Policy module
  capacity_type         = var.capacity_type  # Capacity type for the node group
  subnet_ids            = [module.VPC.vpc_subnet_id_1, module.VPC.vpc_subnet_id_2]  # Subnet IDs for the node group
  disk_size             = var.disk_size  # Disk size for the nodes in the group
  instance_types        = var.instance_types  # Instance types for the nodes in the group
  scaling_config        = var.scaling_config  # Scaling configuration for the node group
  update_config         = var.update_config  # Update configuration for the node group
  ng_depends_on = [module.IAMPolicy.AmazonEKSWorkerNodePolicy_ARN, module.IAMPolicy.AmazonEKS_CNI_Policy_ARN, module.IAMPolicy.AmazonEC2ContainerRegistryReadOnly_ARN, module.IAMPolicy.CloudWatchLogsFullAccess_ARN, module.IAMPolicy.AmazonEBSCSIDriverPolicy_ARN]  # Dependencies for the node group
}

# ==============================================================================
#                          ✨ EKS Add-On Module ✨
# ==============================================================================

module "EKS-AddOn" {
  source = "./modules/EKS-AddOn"  # Specifies the source path for the EKS Add-On module

  cluster_name                                = var.cluster_name  # Cluster name from the EKS module
  eks_addOn_vpc-cni                           = var.eks_addOn_vpc-cni  # Configuration for the VPC CNI add-on
  eks_addOn_vpc-cni_version                   = var.eks_addOn_vpc-cni_version  # Version for the VPC CNI add-on
  eks_addOn_kube-proxy                        = var.eks_addOn_kube-proxy  # Configuration for the Kube Proxy add-on
  eks_addOn_kube-proxy_version                = var.eks_addOn_kube-proxy_version  # Version for the Kube Proxy add-on
  eks_addOn_eks-pod-identity-agent            = var.eks_addOn_eks-pod-identity-agent  # Configuration for the EKS Pod Identity Agent add-on
  eks_addOn_eks-pod-identity-agent_version    = var.eks_addOn_eks-pod-identity-agent_version  # Version for the EKS Pod Identity Agent add-on
  eks_addOn_coredns                           = var.eks_addOn_coredns  # Configuration for the CoreDNS add-on
  eks_addOn_coredns_version                   = var.eks_addOn_coredns_version  # Version for the CoreDNS add-on
  eks_addOn_aws-ebs-csi-driver                = var.aws_ebs_csi_driver  # Configuration for the AWS EBS CSI Driver add-on
  eks_addOn_aws-ebs-csi-driver_version        = var.eks_addOn_aws-ebs-csi-driver_version  # Version for the AWS EBS CSI Driver add-on
}

# ==============================================================================
#                          ✨ EKS Monitoring_Logging Module ✨
# ==============================================================================

module "Monitoring_Logging" {
  source = "./module/Monitoring_Logging"
  cluster_endpoint = module.EKS.cluster_endpoint
  cluster_name = module.EKS.cluster_name
  instace_profile = module.IAMPolicy.instace_profile
}
