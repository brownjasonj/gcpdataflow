#Update with the project you are deploying module to
project_id = "dev-bq-259909"

zone = "europe-west4-a"
region = "europe-west4"

# pubsub variables 
topic = "address"
push_subscriptions = [
#    {
#      name                 = "push"   // required
#      ack_deadline_seconds = 20 // optional
#      push_endpoint        = "https://example.com" // required
#      x-goog-version       = "v1beta1" // optional
#    }
  ]

pull_subscriptions = [
#    {
#      name                 = "pull" // required
#      ack_deadline_seconds = 20 // optional
#    }
]

bq_dataset_name = "risks"
bq_table_name = "address"


