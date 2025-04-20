variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "<YOUR_PJOJECT_ID>"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "europe-north1"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "multi-tier-app-cluster"
}

variable "node_disk_size_gb" {
  description = "The disk size for each node in GB"
  type        = number
  default     = 10
}

variable "machine_type" {
  description = "The machine type for the nodes"
  type        = string
  default     = "e2-micro"
}

variable "node_count" {
  description = "The number of nodes in the node pool"
  type        = number
  default     = 2
}