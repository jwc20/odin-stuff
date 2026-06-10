package uopl

import "core:fmt"

main :: proc() {
	number := 6
	pointer1 := &number // pointer to integer `number`
	pointer2 := pointer1 // pointer to pointer to integer
	pointer2^ = 1

	fmt.println(&pointer1)
	fmt.println(&pointer2)

	fmt.printfln("%i", &pointer1)
}
