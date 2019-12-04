provider "google" {
  version     = "~> 2.5.0"
  # Update credentials to the correct location, alternatively set   GOOGLE_APPLICATION_CREDENTIALS=/path/to/.ssh/bq-key.json in your shell session and   remove the credentials attribute.
  credentials = file("/Users/jason/.ssh/dev-bq-b4b7d0c88820.json") 
}

module "risk-stream" {
  source            = "./risk-stream-module" # Path to the module
  project_id        = "dev-bq-259909" 
  zone              = "europe-west4-a"
  region            = "europe-west4"
  dataset_id        = "risks"
  table_name        = "fred"
  table_schema      = "./schemas/bq-address-schema.json"
  description       = "some description" # updated the description accordingly
  topic_name        = "fred"
  dataflow_name     = "fred2fred"
  dataflow_bucket   = "gs://dev-bq-bucket/dataflow"
}