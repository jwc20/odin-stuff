package uopl 

import "core:fmt"


write_message :: proc(message: string, label: string = "Info") {
	if label != "" {
		fmt.print(label)
		fmt.print(": ")
	}
	fmt.println(message)
}


my_proc :: proc(a:int ,b:=1,c:="string") {
	fmt.println(a,b,c)
}


main :: proc() {
	write_message("Hellope!")
	write_message("Hellope!", "Very important message")

	my_proc(1)
	my_proc(7,c = "bye bye")
	my_proc(2,3,c = "good bye")
	my_proc(c = "bye bye", a = 7)
}