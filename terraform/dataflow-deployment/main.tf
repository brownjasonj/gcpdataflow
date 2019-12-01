provider "google" {
  version     = "~> 2.18.0"
  # Update credentials to the correct location, alternatively set   GOOGLE_APPLICATION_CREDENTIALS=/path/to/.ssh/bq-key.json in your shell session and   remove the credentials attribute.
  credentials = file("/Users/jason/.ssh/dev-bq-b4b7d0c88820.json") 
}

module "dataflow-job" {
  source            = "terraform-google-modules/dataflow/google"
  version           = "1.0.0"
  project_id        = var.project_id
  name              = format("%s:%s:%s", var.topic, var.bq_dataset_name, var.bq_table_name) 
  on_delete         = "cancel"
  region            = var.region
  zone              = var.zone
  max_workers       = 1
  template_gcs_path = "gs://dataflow-templates/latest/PubSub_to_BigQuery"
  temp_gcs_location = "gs://dev-bq-bucket"
  parameters = {
        inputTopic=format("projects/%s/topics/%s", var.project_id, var.topic)
        outputTableSpec=format("%s:%s:%s", var.project_id, var.bq_dataset_name, var.bq_table_name)
  }
}
