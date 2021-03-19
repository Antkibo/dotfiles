package main

/*
   Cyphers a string using ROT13 cypher
*/

import (
	"fmt"
	"strings"
)

func rot(r rune) (r13 rune) {
	if r < 'A' {
		r13 = r
	} else if r < 'N' {
		r13 = r + 13
	} else if r < 'a' {
		r13 = r - 13
	} else if r < 'n' {
		r13 = r + 13
	} else {
		r13 = r - 13
	}
	
	return
}

func main() {
	s := "Great news!"
	fmt.Println(strings.Map(rot, s))
}
