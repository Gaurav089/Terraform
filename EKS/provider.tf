# ==============================================================================
#                     ✨ P R O V I D E R  C O N F I G U R A T I O N ✨
# ==============================================================================

provider "aws" {
  profile = var.aws_profile  # Fetches AWS access keys and secret key from the AWS profile defined in the ".aws" directory
  region  = var.aws_region   # Specifies the AWS region to use for resources
}
