package uopl

import "core:fmt"

main :: proc() {
	x := 123
	defer fmt.println(x)
	{
		defer x = 4
		x = 2 
	}
	fmt.println(x)

	x = 234
}