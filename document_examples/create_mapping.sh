#!/bin/bash

URL="localhost:9096/elasticsearch/doc_versions"
HEADER="Content-Type: application/json"

curl -s -XDELETE "$URL" > /dev/null
curl  -XPUT "$URL" -H "$HEADER" 
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
