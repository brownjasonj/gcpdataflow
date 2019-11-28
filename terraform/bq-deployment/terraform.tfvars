#Update with the project you are deploying module to
project_id = "dev-bq-259909" 

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