
resource "google_bigquery_table" "default" {
    project     = var.project_id
    dataset_id  = var.dataset_id
    table_id    = var.table_name
    schema      = file(var.table_schema)
}

resource "google_pubsub_topic" "default" {
    project     = var.project_id
    name        = var.topic_name
}

resource "google_dataflow_job" "default" {
    project             = var.project_id
    name                = var.dataflow_name
    template_gcs_path   = var.dataflow_template
    temp_gcs_location   = var.dataflow_bucket
    on_delete           = "cancel"
    zone                = var.zone
    region              = var.region
    max_workers         = 1
    parameters          = {
        inputTopic=format("projects/%s/topics/%s", var.project_id, var.topic_name)              # e.g. /projects/{dev-bq-259909}/topics/{fred}
        outputTableSpec=format("%s:%s.%s", var.project_id, var.dataset_id, var.table_name)   # e.g. {dev-bq-259909}:{risks}.fred
        }
}
