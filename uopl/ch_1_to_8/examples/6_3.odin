package uopl

import "core:fmt"


Cat :: struct {
	name: string,
	age: int,
	color: Cat_Color,
}

Cat_Color :: enum {
	Black,
	White,
	Orange,
	Tabby,
	Calico,
}

process_cat_birthday :: proc(cat: ^Cat) {
	if cat == nil {
		return
	}
	cat.age += 1
}

replace_cat :: proc(cat: ^Cat) {
	if cat == nil {
		return
	}

	cat^ = {
		name = "Nibbles",
		age = 1,
		color = .Black,
	}

}

main :: proc() {
	the_cat := Cat {
		name = "the cat",
		age = 4,
		color = .Calico,
	}

	process_cat_birthday(&the_cat)
	fmt.println(the_cat.age)

	replace_cat(&the_cat)
	fmt.println(the_cat)
}