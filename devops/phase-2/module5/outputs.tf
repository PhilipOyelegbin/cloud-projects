output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.multi_tier_app_cluster.name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = google_container_cluster.multi_tier_app_cluster.endpoint
}
