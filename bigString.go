package main

import "fmt"

/*
   Shrinks strings to the same length
   as the shorter string
*/

func shrink(words ...string) []string {
	short := words[0]

	for _, word := range words {
		if len(word) < len(short) {
			short = word
		}
	}
	
	s := make([]string, len(words))

	for i, word := range words {
		s[i] = word[:len(short)]
	}

	return s
}

func main() {
	fmt.Println(shrink("hello", "wor", "apartment", "jj"))
}

