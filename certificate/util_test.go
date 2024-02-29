package provider

import (
	"testing"
)

func TestAccReadCertificate(t *testing.T) {
	// contents, success, error := readPathOrContent("./test-fixtures/certificate/admin.pem")
	// fmt.Print(contents)
	// fmt.Print(error)
	_, success, _ := readPathOrContent("./test-fixtures/certificate/admin.pem")
	if !success {
		t.Fatal("Unable to read from certificate file.")
	}
}
