package main

import (
	"fmt"
	"strings"
)

/*
   padStr(...string) -> string
   Left pad
*/
func pad(mode string, words ...string) (s []string) {
	longest := words[0]

	for _, word := range words {
		if len(word) > len(longest) {
			longest = word
		}
	}

	for _, word := range words {
		if mode == "left" {
			s = append(s, strings.Repeat("0", len(longest) - len(word)) + word)
		} else if mode == "right" {
			s = append(s, word + strings.Repeat("0", len(longest) - len(word)))
		}
	}

	return
}

func main() {
	fmt.Println(pad("right", []string{"you", "are", "great"}...))
}
