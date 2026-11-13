# Where container images are stored
resource "google_artifact_registry_repository" "site" {
  location      = var.region
  repository_id = "site"
  format        = "DOCKER"
}

# The Cloud Run service that serves the site
resource "google_cloud_run_v2_service" "site" {
  name                = "static-site"
  location            = var.region
  deletion_protection = false

  template {
    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/site/static-site:${var.image_tag}"
      ports {
        container_port = 8080
      }
    }

    scaling {
      min_instance_count = 0
      max_instance_count = 2
    }
  }

  depends_on = [google_artifact_registry_repository.site]
}

# Allow anyone on the internet to view the site
resource "google_cloud_run_v2_service_iam_member" "public" {
  name     = google_cloud_run_v2_service.site.name
  location = google_cloud_run_v2_service.site.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
