provider "google" {
  version     = "~> 2.5.0"
  # Update credentials to the correct location, alternatively set   GOOGLE_APPLICATION_CREDENTIALS=/path/to/.ssh/bq-key.json in your shell session and   remove the credentials attribute.
  credentials = file("/Users/jason/.ssh/dev-bq-b4b7d0c88820.json") 
}

module "bigquery" {
  source            = "terraform-google-modules/bigquery/google" # Path to the module
  version           = "~> 2.0.0" # Specify the version of the module you require
  dataset_id        = var.dataset_id
  dataset_name      = var.dataset_name
  description       = "some description" # updated the description accordingly
  expiration        = var.expiration
  project_id        = var.project_id
  location          = var.location
  tables            = var.tables
  time_partitioning = var.time_partitioning
  dataset_labels    = var.dataset_labels
}

module "pubsub" {
  source            = "terraform-google-modules/pubsub/google"
  version           = "~> 1.0"
  topic              = var.topic
  project_id         = var.project_id
  push_subscriptions = var.push_subscriptions
  pull_subscriptions = var.pull_subscriptions
}

module "dataflow-job" {
  source            = "terraform-google-modules/dataflow/google"
  version           = "0.1.0"

  project_id        = var.project_id
  name              = format("%s:%s:%s", var.topic, var.dataset_name, var.tables[0].table_id) 
  on_delete         = "cancel"
  zone              = var.location
  region            = var.location
  max_workers       = 1
  template_gcs_path = "gs://dataflow-templates/latest/PubSub_to_BigQuery"
  temp_gcs_location = "gs://<gcs_path_temp_data_bucket"
  parameters = {
        inputTopic=format("projects/%s/topics/%s", var.project_id, var.topic)
        outputTableSpec=format("%s:%s:%s", var.project_id, var.dataset_name, var.tables[0].table_id)
  }
}
