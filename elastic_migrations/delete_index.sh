#!/bin/bash

# Порождает индекс и инициализирует маппинг.

URL="localhost:9200/doc_versions"
HEADER="Content-Type: application/json"

echo "deleting index doc_versions --------------------------------------"
curl -s -XDELETE "$URL" > /dev/null


