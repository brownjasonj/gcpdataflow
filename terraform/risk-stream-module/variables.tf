variable "project_id" {
  description   = "GCP project where the resource will be "
  type          = string
}

variable "description" {
  description   = "Description of the instance"
  type          = string
}

variable "zone" {
  description   = "Zone where the stream objects are placed"
  type          = string
}

variable "region" {
  description   = "Region where the stream objects are placed"
  type          = string
}

variable "topic_name" {
  description   = "Pubsub topic name to create"
  type          = string
}

variable "dataset_id" {
  description   = "BigQuery dataset underwhich the stream table will be put"
  type          = string
}

variable "table_name" {
  description   = "BigQuery table to be create"
  type          = string
}

variable "table_schema" {
  description   = "Schema of the BigQuery table created"
  type          = string
}

variable "dataflow_name" {
  description   = "Name of the Dataflow object"
  type          = string
}

variable "dataflow_template" {
  description   = "Name of the Dataflow object"
  type          = string
  default       = "gs://dataflow-templates/latest/PubSub_to_BigQuery"
}

variable "dataflow_bucket" {
  description   = "Dataflow bucket"
  type          = string
}
