# ==============================================================================
#                  ✨ EksClusterServiceRole & AmazonEKSNodeRole ✨
# ==============================================================================

# Create EKS Cluster Role
resource "aws_iam_role" "EksClusterServiceRole" {
  name = var.eks_cluster_role_name

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "eks.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

# Attach AmazonEKSClusterPolicy to the created EKS Cluster Role
resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = data.aws_iam_policy.AmazonEKSClusterPolicy.arn
  role       = aws_iam_role.EksClusterServiceRole.name
}

# Create AmazonEKSNodeRole
resource "aws_iam_role" "AmazonEKSNodeRole" {
  name = var.eks_node_group_name

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

# Attach different policies to the created AmazonEKSNodeRole
resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = data.aws_iam_policy.AmazonEKSWorkerNodePolicy.arn
  role       = aws_iam_role.AmazonEKSNodeRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = data.aws_iam_policy.AmazonEKS_CNI_Policy.arn
  role       = aws_iam_role.AmazonEKSNodeRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = data.aws_iam_policy.AmazonEC2ContainerRegistryReadOnly.arn
  role       = aws_iam_role.AmazonEKSNodeRole.name
}

resource "aws_iam_role_policy_attachment" "CloudWatchLogsFullAccess" {
  policy_arn = data.aws_iam_policy.CloudWatchLogsFullAccess.arn
  role       = aws_iam_role.AmazonEKSNodeRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEBSCSIDriverPolicy" {
  policy_arn = data.aws_iam_policy.AmazonEBSCSIDriverPolicy.arn
  role       = aws_iam_role.AmazonEKSNodeRole.name
}

# ==============================================================================
#                           ✨ Karpenter Configuration ✨
# ==============================================================================

# Create Karpenter controller role
resource "aws_iam_role" "karpenter_controller" {
  assume_role_policy = data.aws_iam_policy_document.karpenter_controller_assume_role_policy.json
  name               = "karpenter-controller"
}

# Create Karpenter controller IAM policy
resource "aws_iam_policy" "karpenter_controller" {
  policy = file("/home/ubuntu/Pending_Task/Karpenter/modules/IAMPolicy/controller-trust-policy.json")
  name   = "KarpenterController"
}

# Attach Karpenter controller IAM policy to the role
resource "aws_iam_role_policy_attachment" "aws_load_balancer_controller_attach" {
  role       = aws_iam_role.karpenter_controller.name
  policy_arn = aws_iam_policy.karpenter_controller.arn
}

# Create an instance profile for Karpenter
resource "aws_iam_instance_profile" "karpenter" {
  name = "KarpenterNodeInstanceProfile1"
  role = aws_iam_role.AmazonEKSNodeRole.name
}
