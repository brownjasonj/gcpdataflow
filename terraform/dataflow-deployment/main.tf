provider "google" {
  version     = "~> 2.5.0"
  # Update credentials to the correct location, alternatively set   GOOGLE_APPLICATION_CREDENTIALS=/path/to/.ssh/bq-key.json in your shell session and   remove the credentials attribute.
  credentials = file("/Users/jason/.ssh/dev-bq-b4b7d0c88820.json") 
}

module "dataflow-job" {
  source            = "terraform-google-modules/dataflow/google"
  version           = "0.1.0"

  project_id        = "<project_id>"
  job_name          = "<job_name>"$TOPIC_NAME:$BQ_DATASET:$BQ_TABLE 
  on_delete         = "cancel"
  zone              = "EUROPE"
  max_workers       = 1
  template_gcs_path =  "gs://dataflow-templates/latest/PubSub_to_BigQuery"
#  temp_gcs_location = "gs://<gcs_path_temp_data_bucket"
  parameters = {
        inputTopic=projects/$PROJECT_ID/topics/$TOPIC_NAME
        foo = outputTableSpec=$PROJECT_ID:$BQ_DATASET.$BQ_TABLE
  }
}