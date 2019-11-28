variable "project_id" {
  description = "Project wheree the dataset and table are created"
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