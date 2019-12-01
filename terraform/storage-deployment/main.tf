module "gcs_buckets" {
  source                = "terraform-google-modules/cloud-storage/google"
  version               = "1.0.0"
  project_id            = var.project_id
  location              = var.location
  storage_class         = "REGION"
  prefix                = format("%s-%s-%s", var.topic, var.bq_dataset_name, var.bq_table_name)
  names                 = ["first"]
  bucket_policy_only    = { first = true}
}