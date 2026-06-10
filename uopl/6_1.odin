package uopl

import "core:fmt"


increment_number :: proc(num: ^int) { // ^int can be read as "pointer to integer"
	num^ += 1 // fetches the integer at the address that num points to, adds 1 to it and store back at that address
	// num^ = num^ + 1
}

main :: proc() {
	number := 7
	number_pointer := &number 
	increment_number(number_pointer)
	fmt.println(number)

	fmt.printfln("%i", number_pointer) // print a pointer as an integer number
	fmt.println(typeid_of(type_of(number_pointer)))
}