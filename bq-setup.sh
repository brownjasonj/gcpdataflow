bq --location=EUROPE mk -d --default_table_expiration 31536000 --description "Addresses dataset" addresses
bq mk --table addresses.addresses ./bq-address-schema.json
bq load --source_format=NEWLINE_DELIMITED_JSON addresses.addressess ./address-examples.json ./bq-address-schema.json

