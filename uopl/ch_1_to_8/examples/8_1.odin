package uopl

import "core:fmt"


Rectangle :: struct {
	x: f32,
	y: f32,
	height: f32,
	width: f32,
}


main :: proc() {
	arr: [7]int 

	arr = {1,2,3,4,5,6,7}
	arr = {} // clear all values

	some_ints:= [7]int{1,2,3,4,5,6,7}

	some_ints[3] = 4
	some_ints[4] = 5
	some_ints[5] = 6

	fmt.println(some_ints[4])

	for v in some_ints {
		fmt.println(v)
	}

	for v, i in some_ints {
		fmt.println(i, v)
	}


	for &v in some_ints {
		v *= 2
	}
	fmt.println(some_ints)

	// ---------

	rectangles: [10]Rectangle
}