package main

// Сохранение версии документа в version-store
// Пример показывает как делать запросы к хранилищу версий version-store из Go приложений.

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"time"
)

// getNewVersion Создает JSON нового документа
func getNewVersion() string {
	t := time.Now()
	unixTime := t.Unix()
	// unixTime := t.Format(time.RFC3339)
	return fmt.Sprintf(`
	{
		"id":1,
		"type":"info",
		"version_author": "Go program",
		"version_time" : %d,
		"info": "Go Test %d"
	}`, unixTime, unixTime)
}

// saveVersion Сохраняет версию документа doc в базу данных.
// doc - это JSON документа с обязательными полями type, id, version_time.
// По сути это один POST запрос.
func saveVersion(doc string) string {

	// Берем URL из переменной окружения.
	// Если не определена, предполагаем локальную разработку
	url, ok := os.LookupEnv("POST_URL")
	if !ok {
		url = "http://localhost:9096/elasticsearch/doc_versions/_doc/?pretty"
	}

	resp, err := http.Post(url, "application/json", bytes.NewBuffer([]byte(doc)))
	if err != nil {
		fmt.Println(err.Error())
		return err.Error()
	}
	defer resp.Body.Close()

	fmt.Println("response Status:", resp.Status)
	body, _ := ioutil.ReadAll(resp.Body)
	return string(body)
}

func main() {
	fmt.Println("Version-Store goapp started at port :8090")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		doc := getNewVersion()
		res := saveVersion(doc)
		fmt.Fprintln(w, "Новая версия сохраняемого документа ----------------------")
		fmt.Fprintln(w, doc)
		fmt.Fprintln(w, "_id и другие параметры сохраненной версии --------------------------------")
		fmt.Fprintln(w, res)
	})
	http.ListenAndServe(":8090", nil)
}
