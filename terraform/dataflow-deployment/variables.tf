variable "project_id" {
  description = "Project wheree the dataset and table are created"
  type = string
}

variable "region" {
    description = "region of resources"
    type = string
}

variable "zone" {
    description = "zone of resources"
    type = string
}

variable "topic" {
    description = "Name of pubsub topic"
    type = string
}

variable "push_subscriptions" {
  description = "A list of push subscriptions"
  default     = []
  type        = list(object({
    name = string,
    ack_deadline_seconds = number,
    push_endpoint = string,
    x-goog-version = string
}))
}

variable "pull_subscriptions" {
  description = "A list pull subscription"
  default     = []
  type        = list(object({
    name = string,
    ack_deadline_seconds = number,
}))
}

variable "bq_dataset_name" {
    description = "BigQuery dataset name"
    type = string
}

variable "bq_table_name" {
    description = "BigQuery table name"
    type = string
}