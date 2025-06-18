# Configura o provedor do Google Cloud
provider "google" {
  project = var.meu-projeto-stage
  region  = var.us-central1
}

terraform {
  backend "gcs" {
    bucket = "meu-projeto-stage-123456-tfstate" 
    prefix = "terraform/state/stage" 
  }
}
