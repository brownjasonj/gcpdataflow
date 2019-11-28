provider "google" {
  version     = "~> 2.5.0"
  # Update credentials to the correct location, alternatively set   GOOGLE_APPLICATION_CREDENTIALS=/path/to/.ssh/bq-key.json in your shell session and   remove the credentials attribute.
  credentials = file("/Users/jason/.ssh/dev-bq-b4b7d0c88820.json") 
}

module "bigquery" {
  source            = "terraform-google-modules/bigquery/google" # Path to the module
  version           = "~> 2.0.0" # Specify the version of the module you require
  dataset_id        = "risks"
  dataset_name      = "risks"
  description       = "some description" # updated the description accordingly
  expiration        = var.expiration
  project_id        = var.project_id
  location          = "EUROPE" # Update location if needed
  tables            = var.tables
  time_partitioning = var.time_partitioning
  dataset_labels    = var.dataset_labels
}
