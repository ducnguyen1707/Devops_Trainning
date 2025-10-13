package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello from Go running on port 8086!")
    })

    fmt.Println("Server starting on port 8086...")
    http.ListenAndServe(":8086", nil)
}