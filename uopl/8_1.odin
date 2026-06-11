package uopl

import "core:fmt"

main :: proc() {
	arr: [7]int 

	arr = {1,2,3,4,5,6,7}
	arr = {} // clear all values

	some_ints:= [7]int{1,2,3,4,5,6,7}

	some_ints[3] = 4
	some_ints[4] = 5
	some_ints[5] = 6

	fmt.println(some_ints[4])


}