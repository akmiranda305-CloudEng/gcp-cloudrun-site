variable "project_id" {
  description = "Your GCP project ID"
  type        = string
}

variable "region" {
  description = "Region to deploy to"
  type        = string
  default     = "us-central1"
}

variable "image_tag" {
  description = "Container image tag to deploy"
  type        = string
  default     = "v1"
}

variable "github_repo" {
  description = "GitHub repo allowed to deploy, in owner/name form"
  type        = string
}
