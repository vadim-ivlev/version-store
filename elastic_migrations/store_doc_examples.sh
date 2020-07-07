#!/bin/bash

# Наполняет индекс тестовыми документами

URL="localhost:9096/elasticsearch/doc_versions"
HEADER="Content-Type: application/json"

# Загружаем тестовые данные
curl -s -XPOST "$URL/_bulk?refresh=true" -H "$HEADER" --data-binary "@doc_examples.json"  > /dev/null
# Показываем перечень индексов
curl -s "localhost:9096/elasticsearch/_cat/indices?v&format=txt"

