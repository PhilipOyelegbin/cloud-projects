resource "google_container_cluster" "multi_tier_app_cluster" {
  name     = var.cluster_name
  location = var.region

  # Enable Autopilot (optional)
  enable_autopilot = true

  # Disable default node pool (we'll create a custom one)
  # remove_default_node_pool = true

  deletion_protection = false
  initial_node_count       = 1
  num-nodes = 2

  # Network configuration
  network    = "default"
  subnetwork = "default"

  # Enable private cluster (optional)
  # private_cluster_config {
  #   enable_private_nodes = true
  #   master_ipv4_cidr_block = "172.16.0.0/28"
  # }

  # Enable workload identity (optional)
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}

