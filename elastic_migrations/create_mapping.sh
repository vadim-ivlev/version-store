#!/bin/bash

# Порождает индекс и инициализирует маппинг.

URL="localhost:9200/doc_versions"
HEADER="Content-Type: application/json"

# echo "deleting index doc_versions--------------------------------------"
# curl -s -XDELETE "$URL" > /dev/null

echo
echo "creaing index doc_versions -------------------------------------"
curl  -XPUT "$URL" -H "$HEADER" 

echo
echo "creating mapping for index doc_versions--------------------------"
curl  -XPUT "$URL/_mapping?pretty" -H "$HEADER" -d'{
    "dynamic": false,
    "properties": {
      "id":             { "type": "long" }, 
      "type":           { "type": "keyword" },
      "version_time" :  { "type": "date" }
    }
}'
echo "M A P P I N G -----------------------------------------"
curl -XGET "$URL/_mapping?pretty" 
