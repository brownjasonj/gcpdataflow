provider "google" {
  version     = "~> 2.18.0"
  # Update credentials to the correct location, alternatively set   GOOGLE_APPLICATION_CREDENTIALS=/path/to/.ssh/bq-key.json in your shell session and   remove the credentials attribute.
  credentials = file("/Users/jason/.ssh/dev-bq-b4b7d0c88820.json") 
}

module "pubsub" {
  source                = "terraform-google-modules/pubsub/google"
  version               = "1.0.0"
  topic                 = var.topic
  project_id            = var.project_id
  push_subscriptions    = var.push_subscriptions
  pull_subscriptions    = var.pull_subscriptions
}