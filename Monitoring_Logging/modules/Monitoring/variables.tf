# ==============================================================================
#                                  ✨ Common Variables ✨
# ==============================================================================

variable "cluster_name" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}

variable "instance_profile" {
   type = string
}

# ==============================================================================
#                                  ✨ For Grafana✨
# ==============================================================================


variable "grafana_admin_user" {
  description = "Grafana admin username"
  type        = string
  default     = "admin"
}

variable "grafana_admin_password" {
  description = "Grafana admin password"
  type        = string
  default     = "qwerty"
}

variable "monitoring_namespace" {
  description = "The namespace to deploy Grafana"
  type        = string
  default     = "monitoring-ns"
}

variable "storage_class" {
  description = "Storage class for persistence"
  type        = string
  default     = "gp2"
}

variable "service_type" {
  description = "Service type for Grafana"
  type        = string
  default     = "NodePort"
}

# ==============================================================================
#                                  ✨ For Prometheus ✨
# ==============================================================================

variable "metrics_enabled" {
  description = "Enable metrics"
  type        = bool
  default     = true
}

variable "service_monitor_namespace" {
  description = "Namespace for service monitor"
  type        = string
  default     = "tf-prometheus-configmap"
}

# ==============================================================================
#                                  ✨ For Loki ✨
# ==============================================================================

variable "logging_namespace" {
  description = "The namespace to deploy Loki"
  type        = string
  default     = "logging-ns"
}

variable "promtail_namespace" {
  description = "Namespace for Promtail"
  type        = string
  default     = "promtail-ns"
}