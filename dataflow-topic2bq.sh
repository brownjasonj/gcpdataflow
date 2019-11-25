#!/bin/bash 
PROJECT_ID=dev-bq-259909
REGION=europe-west2
TOPIC_NAME=addresses_addresses
BQ_DATASET=addresses
BQ_TABLE=addresses



gcloud pubsub topics create $TOPIC_NAME

gcloud dataflow jobs run $TOPIC_NAME:$BQ_DATASET:$BQ_TABLE --gcs-location gs://dataflow-templates/latest/PubSub_to_BigQuery --parameters inputTopic=projects/$PROJECT_ID/topics/$TOPIC_NAME,outputTableSpec=$PROJECT_ID:$BQ_DATASET.$BQ_TABLE