package uopl

import "core:fmt"

// 1
Rectangle :: struct {
	x: f32,	
	y: f32,
	width: f32,
	height: f32,
}

main :: proc() {
	// 3
	// rect: Rectangle

	// 4 
	rect := Rectangle {
		width = 20,
		height = 10,
	}

	// 6
	// rect: Rectangle = {
	// 	width = 20,
	// 	height = 10,
	// }

	// 7
	rect =  {
		x = 1,
		width = 20,
		height = 10,
	}

	rect1 := Rectangle {
		20, 20,
		200, 100,
	}

}