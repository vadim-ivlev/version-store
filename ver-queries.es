
GET _cat/indices?v&format=txt

DELETE doc_versions

PUT doc_versions

PUT doc_versions/_mapping
{
    "dynamic": false,
    "properties": {
      "id": { "type": "long"  }, 
      "type": { "type": "keyword"  },
      "version_time" : { "type" : "date" },
      "version_author": {"type":"keyword"}
    }
}

# "time" :  { "type" : "date", "format": "yyyy-MM-dd HH:mm:ss||epoch_millis" }
# "time" :  { "type" : "date", "format": "strict_date_optional_time||epoch_millis" }


GET doc_versions/_mapping

POST doc_versions/_doc/
{
  "id":1,
  "type":"info",
  "version_author": "Chagin Max",
  "version_time" : "2019-09-08T12:39:01.03",
  "info": "This is an additional info2"
}


# _search API
# Получить список версий документа по его идентификатору и типу документа


GET doc_versions/_search?q=(type:info)&sort=version_time:desc


# https://auth-proxy.rg.ru/apps/version-store/doc_versions/_search?pretty&q=(type:info)&sort=version_time:desc



GET doc_versions/_search?q=(type:material)AND(id:4899)&size=2&sort=version_time:desc&_source=type,id,version_time,title,editor

# Получить документ по его идентификатору

GET doc_versions/_search?q=_id:1x0jJXMBlIl0j5pGmEbq

# _doc API
# Получить документ по его идентификатору
GET doc_versions/_doc/1x0jJXMBlIl0j5pGmEbq

# https://auth-proxy.rg.ru/apps/version-store/doc_versions/_doc/ufmULnMB7-Vwr_C2r4CJ?pretty


GET doc_versions/_search
{
  "query": {
    "match_all": {}
  }
}


POST _sql?format=txt
{
  "query": """
  SELECT * FROM "doc_versions"
  -- WHERE version_time='2019-09-08T12:39:01.020Z'
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


