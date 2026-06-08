#+feature dynamic-literals
package docs_example

import "core:fmt"

main :: proc() {
	for i := 0; i < 10; i += 1 {
		fmt.println(i)
	}

	fmt.println("\n")

	some_string := "Hello, 世界"
	for character in some_string {
		fmt.println(character)
	}

	some_array := [3]int{1,4,9}
	for value in some_array {
		fmt.println(value)
	}

	some_dynamic_array := [dynamic]int{12,3,4,5}
	defer delete(some_dynamic_array)
	for value in some_dynamic_array {
		fmt.println(value)
	}

	some_map := map[string]int{"A" = 1, "C" = 9, "B" = 4}
	defer delete(some_map)
	for key, value in some_map {
		fmt.println(key, value)
	}


	array := [?]int {10, 20, 30, 40, 50}
	#reverse for x in array {
		fmt.println(x)
	}
}