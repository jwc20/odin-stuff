package uopl


import "core:fmt"

increment_number1 :: proc(num: ^int) {
	if num != nil {
		num^ += 1
	}
}

increment_number2 :: proc(num: ^int) {
	if num == nil {
		return
	} 
	num^ += 1
}

main :: proc() {
	my_pointer: ^int 
	
	// will crash -> SIGTERM
	// my_pointer^ = 12 

	number := 7

	increment_number1(&number)
	fmt.println(number)
	increment_number2(&number)
	fmt.println(number)
}