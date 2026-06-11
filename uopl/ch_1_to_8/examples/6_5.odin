package uopl

import "core:fmt"

main :: proc() {
	number := 1
	pointer1 := &number

	// read through pointer
	pointer1_value := pointer1^
	fmt.println(pointer1_value)

	// write through pointer
	pointer1^ = 5
	fmt.println(pointer1^)



	arr: [20]int
	tenth_elem_ptr := &arr[10] // arr[10] is an addressable that still refer to the tenth element of the array
 	fmt.println(tenth_elem_ptr)



	copy_elem := arr[10]
	copy_elem_ptr := &copy_elem


	number_pointer := &number
	number_pointer^ = 10
	another_number := number_pointer^

} 