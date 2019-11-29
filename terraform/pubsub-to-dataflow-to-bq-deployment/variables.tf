variable "expiration" {
  description = "TTL of tables using the dataset in MS"
  default     = null
}

variable "project_id" {
  description = "Project wheree the dataset and table are created"
}

variable "location" {
    description = "Location of resources"
    default = "europe-west4"
    type = string
}

variable "time_partitioning" {
  description = "Configures time-based partitioning for this table"
}

variable "dataset_id" {
    description = "dataset id"
    type = string
}

variable "dataset_name" {
    description = "dataset name"
    type = string
}
variable "dataset_labels" {
  description = "A mapping of labels to assign to the table"
  type        = map(string)
}

variable "tables" {
  description = "A list of maps that includes both table_id and schema in each element, the table(s) will be created on the single dataset"
  default     = []
  type        = list(object({
    table_id  = string,
    schema    = string,
    labels    = map(string),
}))
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


