package main

import "fmt"

func pascalIter(n int, l []int) []int {
	s := make([]int, n)

	for i := 0; i < n; i++ {
		if i == 0 || i == n - 1 {
			s[i] = 1
		} else {
			s[i] = l[i - 1] + l[i]
		}
	}

	return s
}

func pascal(n int) []int {
	l := []int{1, 1}

	switch n {
	case 0:
		return []int{}
	case 1:
		return []int{1}
	case 2:
		return l
	default:
		for i := 3; i <= n; i++ {
			l = pascalIter(i, l)
		}
	}

	return l;
}

func main() {
	fmt.Println(pascal(20))
}
