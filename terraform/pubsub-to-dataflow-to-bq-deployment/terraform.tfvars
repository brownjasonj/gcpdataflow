#Update with the project you are deploying module to
project_id = "dev-bq-259909" 



dataset_id = "risks"
dataset_name = "risks"

#Time that 
time_partitioning = "DAY" 

#The labels for dataset being deployed
dataset_labels = {
  env   = "dev"
  billable   = "true"
  owner = "jason"
}

#List of the tables that you are 
tables = [
  {
    table_id = "address",
    schema = "bq-address-schema.json",
    labels = {
      env = "dev"
      billable = "true"
      owner = "jason"
    },
  },
]

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


names = ["first"]