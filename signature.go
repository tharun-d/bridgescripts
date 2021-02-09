// run in play ground
package main

import (
	"crypto/md5"
	"fmt"
)

type AlfaTopupRequest struct {
	Login                   string
	Password                string
	Terminal                string
	CustomerKey             string
	TransactionDateString   string
	TransactionType         string
	TransactionAmountString string
	ClientReferenceID       string
	CustomerName            string
	AccountType             string
}

func main() {
	fmt.Println("Hello, playground")
	data := AlfaTopupRequest{
		Login:                   "AlfaLogin",
		Password:                "AlfaPassword",
		Terminal:                "KZ01;K329;F",
		CustomerKey:             "1356885489749880832",
		TransactionDateString:   "20180202094537",
		TransactionType:         "111",
		TransactionAmountString: "500",
		ClientReferenceID:       "sdftqqqeq111ww11qww1111q11111q11aa111111aa111111q",
		CustomerName:            "Asfar",
		AccountType:             "01",
	}
	secretKey := "AlfaKey"

	fmt.Println("secret key in db : ", secretKey)
	plian := data.Login + data.Password + data.Terminal + data.CustomerKey + data.TransactionDateString + data.TransactionType + data.TransactionAmountString
	plian = plian + data.ClientReferenceID + data.CustomerName + data.AccountType + secretKey

	finalSignature := fmt.Sprintf("%x", md5.Sum([]byte(plian)))
	fmt.Println("finalSignature : ", finalSignature)
}
