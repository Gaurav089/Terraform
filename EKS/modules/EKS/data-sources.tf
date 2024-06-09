# ==============================================================================
#                              ✨ For OIDC ✨
# ==============================================================================

data "tls_certificate" "oidc" {
  url = aws_eks_cluster.TF-eks.identity[0].oidc[0].issuer
}
