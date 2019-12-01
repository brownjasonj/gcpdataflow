variable "project_id" {
  description = "Project wheree the dataset and table are created"
  type = string
}

variable "location" {
    description = "Resource location"
    type = string
}

variable "topic" {
    description = "Name of pubsub topic"
    type = string
}

variable "bq_dataset_name" {
    description = "BigQuery dataset name"
    type = string
}

variable "bq_table_name" {
    description = "BigQuery table name"
    type = string
}