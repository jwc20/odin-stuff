package uopl

import "core:fmt"


// stores type names
My_Union :: union {
	f32,
	int, 
	Person_Data,
}

Person_Data :: struct {
	health: int, 
	age: int,
}


main :: proc() {
	val: My_Union = int(12)
	fmt.println(val)

	val = Person_Data {
		health = 72,
		age = 21,
	}

	switch v in val {
		case int:
			fmt.println(v)
		case f32:
			fmt.println(v)
		case Person_Data:
			fmt.println(v.age)
	}

	switch &v in val {
		case int:
			fmt.println(v)
			v = 4
			fmt.println(v)
		case f32:
			fmt.println(v)
			v = 32
			fmt.println(v)
		case Person_Data:
			fmt.println(v.age)
			v.age = 40
			fmt.println(v.age)
	}
}