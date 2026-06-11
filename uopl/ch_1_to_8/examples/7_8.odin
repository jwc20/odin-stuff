package uopl


import "base:runtime"
import "core:fmt"

main :: proc() {
	fmt.println("Program running")
}

@init
startup :: proc "contextless" () {
	context = runtime.default_context()
	fmt.println("Program started")
}

@fini
shutdown :: proc "contextless" () {
	context = runtime.default_context()
	fmt.println("Program shutdown")
}