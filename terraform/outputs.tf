output "site_url" {
  description = "Public URL of the site"
  value       = google_cloud_run_v2_service.site.uri
}
