#!/bin/bash

# Порождает индекс и инициализирует маппинг.
./create_mapping.sh

# Наполняет индекс тестовыми документами
./store_doc_examples.sh