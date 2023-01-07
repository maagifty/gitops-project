terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.47.0"
    }
  }

  backend "gcs" {
    bucket = "terraform-backend-hard-work-374007"
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}

resource "google_service_account" "default" {
  account_id   = "${var.name}-sa"
  display_name = "${var.name}-sa"
}

resource "google_container_cluster" "main" {
  name     = "${var.name}-cluster"
  location           = var.location
  initial_node_count = 3
  node_config {
    service_account = google_service_account.main.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}