output "project_id" {
  description   = "GCP project where the resource will be "
  value          = var.project_id
}

output "dataset_id" {
  description   = "BigQuery dataset underwhich the stream table will be put"
  value          = var.dataset_id
}

output "zone" {
  description   = "Zone where the stream objects are placed"
  value          = var.zone
}

output "region" {
  description   = "Region where the stream objects are placed"
  value          = var.region
}

output "topic_name" {
  description   = "Pubsub topic name to create"
  value          = var.topic_name
}

output "table_name" {
  description   = "BigQuery table to be create"
  value          = var.table_name
}

output "table_schema" {
  description   = "Schema of the BigQuery table created"
  value          = var.table_schema
}

output "dataflow_name" {
  description   = "Name of the Dataflow object"
  value          = var.dataflow_name
}

output "dataflow_template" {
  description   = "Name of the Dataflow object"
  value          = var.dataflow_template
}

output "dataflow_bucket" {
  description   = "Dataflow bucket"
  value          = var.dataflow_bucket
}