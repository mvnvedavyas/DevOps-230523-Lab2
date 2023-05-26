package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Printf("Started file.go\n")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, World!")
	})
	http.ListenAndServe(":8080", nil)
}