# ==============================================================================
#                            ✨ Provider Variables ✨
# ==============================================================================

aws_profile = "default"  # Specifies the AWS CLI profile to use
aws_region  = "us-east-2"  # Specifies the AWS region to deploy resources

# ==============================================================================
#                               ✨ VPC Variables ✨
# ==============================================================================

vpc_cidr                               = "10.0.0.0/16"  # CIDR block for the VPC
public_subnet_cidrs                    = ["10.0.0.0/18", "10.0.64.0/19", "10.0.96.0/19"]  # CIDR blocks for public subnets
private_subnet_cidrs                   = ["10.0.128.0/18", "10.0.192.0/19", "10.0.224.0/19"]  # CIDR blocks for private subnets
public_rt_destination_cidr_block       = "0.0.0.0/0"  # Destination CIDR block for the public route table
private_rt_destination_cidr_block      = "0.0.0.0/0"  # Destination CIDR block for the private route table
vpc_security_group_name                = "Test-VPC-SG"  # Name for the VPC security group
vpc_security_group_description         = "SG for VPC"  # Description for the VPC security group
vpc_security_group_ingress_cidr_blocks = ["0.0.0.0/0"]  # Ingress CIDR blocks for the VPC security group

# ==============================================================================
#                            ✨ IAM Policy Variables ✨
# ==============================================================================

eks_cluster_role_name = "Test-EksClusterServiceRole"  # Role name for the EKS cluster service
eks_node_group_name   = "Test-AmazonEKSNodeRole"  # Name for the EKS node group role

# ==============================================================================
#                      ✨ EKS Security Group Variables ✨
# ==============================================================================

eks_security_group_name                = "Test-EKS-SG"  # Name for the EKS security group
eks_security_group_description         = "SG of EKS"  # Description for the EKS security group
eks_security_group_ingress_cidr_blocks = ["0.0.0.0/0"]  # Ingress CIDR blocks for the EKS security group

# ==============================================================================
#                               ✨ EKS Variables ✨
# ==============================================================================

cluster_name = "Test-EKS-Terraform"  # Name for the EKS cluster

# ==============================================================================
#                            ✨ Node Group Variables ✨
# ==============================================================================

node_group_name = "Test-node-group"  # Name for the EKS node group
capacity_type   = "ON_DEMAND"  # Capacity type for the node group
disk_size       = 20  # Disk size for the nodes in the group
instance_types  = ["t2.small"]  # Instance types for the nodes in the group
scaling_config = {  # Scaling configuration for the node group
  desired_size = 2  # Desired number of nodes
  max_size     = 2  # Maximum number of nodes
  min_size     = 1  # Minimum number of nodes
}
update_config = {  # Update configuration for the node group
  max_unavailable = 1  # Maximum number of nodes that can be unavailable during updates
}

# ==============================================================================
#                           ✨ EKS Add-On Variables ✨
# ==============================================================================

eks_addOn_vpc-cni = "vpc-cni"  # Configuration for the VPC CNI add-on
eks_addOn_kube-proxy = "kube-proxy"  # Configuration for the Kube Proxy add-on
eks_addOn_eks-pod-identity-agent = "eks-pod-identity-agent"  # Configuration for the EKS Pod Identity Agent add-on
eks_addOn_coredns = "coredns"  # Configuration for the CoreDNS add-on
aws_ebs_csi_driver = "aws-ebs-csi-driver"  # Configuration for the AWS EBS CSI Driver add-on

# ==============================================================================
#                        ✨ EKS Add-On Version Variables ✨
# ==============================================================================

eks_addOn_vpc-cni_version              = "v1.18.1-eksbuild.3"  # Version for the VPC CNI add-on
eks_addOn_kube-proxy_version           = "v1.29.3-eksbuild.5"  # Version for the Kube Proxy add-on
eks_addOn_eks-pod-identity-agent_version = "v1.2.0-eksbuild.1"  # Version for the EKS Pod Identity Agent add-on
eks_addOn_coredns_version              = "v1.11.1-eksbuild.9"  # Version for the CoreDNS add-on
eks_addOn_aws-ebs-csi-driver_version             = "v1.31.0-eksbuild.1"  # Version for the AWS EBS CSI Driver add-on
