package main

import (
	"fmt"
	"os"
)

func main() {
	password, err := os.ReadFile("/run/secrets/password")
	if err != nil {
		panic(err)
	}

	fmt.Println("Buildkit secret pass: ", string(password))
	fmt.Println("Build arg pass:" + os.Getenv("INSECURE_PASS"))
}
