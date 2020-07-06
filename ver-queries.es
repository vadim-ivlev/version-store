
GET _cat/indices?v&format=txt

DELETE articles

PUT articles

PUT articles/_mapping
{
    "dynamic": false,
    "properties": {
      "id":             { "type": "long" }, 
      "type":           { "type": "keyword" },
      "version_time" :  { "type": "date" }
    }
}

// "version_time" :  { "type" : "date", "format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis" }

GET articles/_mapping

# sql
# _bulk

POST articles/_doc/
{
  "id":"01",
  "author":"Chagin Max",
  "time" : "2019-09-08T12:39:01",
  "info": "This is an additional info"
}

POST articles/_doc/
{
  "id":"01",
  "author":"Chagin Max",
  "time" : "2019-09-08T12:39:02",
  "info1": "This is an additional info1"
}



GET articles/_search
{
  "query": {
    "match_all": {}
  }
}

PUT /articles
{
  "mappings": {
    "dynamic": false,
    "properties": {
      "id":     { "type": "keyword"  }, 
      "author": { "type": "text"  },
      "version_time" :  { "type" : "date" }
    }
  }
}

POST _sql?format=txt
{
  "query": """
  SELECT version_time, id, url FROM "doc_versions"
  ORDER BY version_time DESC
  """
}

POST _sql/translate
{
  "query": """
  SELECT version_time FROM "doc_versions"
  ORDER BY version_time DESC
  """
}





