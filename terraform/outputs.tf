output "site_url" {
  description = "Public URL of the site"
  value       = google_cloud_run_v2_service.site.uri
}

output "wif_provider" {
  value = google_iam_workload_identity_pool_provider.github.name
}

output "deployer_service_account" {
  value = google_service_account.deployer.email
}
