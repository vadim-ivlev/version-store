#!/bin/bash

# Наполняет индекс тестовыми документами

URL="localhost:9200"
HEADER="Content-Type: application/json"

# Загружаем тестовые данные
curl -s -XPOST "$URL/doc_versions/_bulk?refresh=true" -H "$HEADER" --data-binary "@doc_examples.json"  > /dev/null
# Показываем перечень индексов
curl -s "$URL/_cat/indices?format=txt"

