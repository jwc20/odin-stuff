package uopl

import "core:fmt"

Rectangle :: struct {
	x: f32,
	y: f32,
	width: f32,
	height: f32,
}

Person_Stats :: struct {
	health: int,
	age: int,
}

Person :: struct {
	using stats: Person_Stats,
	name: string,
}

// storing procedure within a struct
// My_Interface :: struct {
// 	required_name_length: int,
// 	is_valid_name: proc(My_Interface, string) -> bool, // this is like storing function pointers in a struct in C
// }

// my_proc :: proc(i: My_Interface, name: string) -> bool, {
// 	return i.required_name_length == len(name)
// }

// my_interface := My_Interface {
// 	required_name_length=5,
// 	is_valid_name = my_proc,
// }
// //--------

	
main :: proc() {

	rect := Rectangle {
		width = 20,
		height = 10,
	}

	p := Person {
		stats = {
			health = 20,
		},
		name = "bob",
	}

	fmt.println(rect)
	fmt.println(p)

	p.age = 70
	hs := p.health

	fmt.println(p.age)
	fmt.println(hs)




}