terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  credentials = "<YOUR_PROJECT_KEY>"
  project     = var.project_id
  region      = var.region
}