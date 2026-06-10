package uopl

import "core:fmt"

Shape :: union {
	Shape_Circle,
	Shape_Square,
}

Shape_Circle :: struct {
	radius: f32,
}

Shape_Square :: struct {
	width: f32,
}

Shape1 :: enum {
	Circle,
	Square,
}

main :: proc() {
	// Zero value: nil
	shape: Shape	
	fmt.println(shape)

	// Zero value: Shape.Circle
	shape1: Shape1
	fmt.println(shape1)
}