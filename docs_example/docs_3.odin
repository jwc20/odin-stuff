package docs_example

import "core:fmt"

main :: proc() {
	x := 10

	if x >= 0 {
		fmt.println("x is positive")
	}

	if y := fibonacci(x); y >= 0 {
		fmt.println("y is not negative")
	}

}

fibonacci :: proc(n: int) -> int {
	switch {
	case n < 1:
		return 0 
	case n == 1:
		return 1 
	}
	return fibonacci(n-1) + fibonacci(n-2)
}