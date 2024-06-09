# ==============================================================================
#                                  ✨ Kubernetes Storage Class ✨
# ==============================================================================
resource "kubernetes_storage_class" "grafana-storage-class" {
  metadata {
    name = "grafana-storage-class"
  }
  storage_provisioner = "kubernetes.io/aws-ebs"
  parameters = {
    type = "gp2" 
  }
}

# ==============================================================================
#                                  ✨ Kube-Prometheus-Stack ✨
# ==============================================================================
resource "helm_release" "kube_prometheus_stack" {
  name             = "kube-prometheus-stack"
  namespace        = var.monitoring_namespace
  create_namespace = true

  chart = "${path.module}/chart/kube-prometheus-stack"

  force_update = true

}

# ==============================================================================
#                                  ✨ Loki-Stack ✨
# ==============================================================================

resource "helm_release" "loki_stack" {
  name             = "loki-stack"
  namespace        = var.monitoring_namespace
  create_namespace = false

  chart      = "${path.module}/chart/loki-stack"

  force_update = true
}
