terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.37.0"
    }
  }
}

provider "google" {
  credentials = "./keys/my-creds.json"
  project     = "empyrean-engine-460603-h4"
  region      = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "empyrean-engine-460603-h4-terra-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }

}