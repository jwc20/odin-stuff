package docs_example

import "core:fmt"

main :: proc() {
    // x := 10
    // y, z := "C:\\Windows\\notepad.exe", "hello\nhello\nea"

    x :: "what"
    y : int : 23 
    z :: y + 23

    fmt.println(x, y, z)
}
