#!/bin/bash

curl -s -H "Content-Type: application/json" -XPOST "localhost:9096/elasticsearch/doc_versions/_bulk?refresh=true" --data-binary "@article_examples.json" > /dev/null
curl -s "localhost:9096/elasticsearch/_cat/indices?v&format=txt"

