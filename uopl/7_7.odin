package uopl

import "core:fmt"
import "core:math"



length :: proc {
	length_float2,
	length_float3,
}


length_float2 :: proc(v: [2]f32) -> f32 {
	return math.sqrt(v.x*v.x + v.y*v.y)
}
length_float3 :: proc(v: [3]f32) -> f32 {
	return math.sqrt(v.x*v.x + v.y*v.y + v.z*v.z)	
}	


main :: proc() {
	l2 := length([2]f32{1.0,2.0})
	fmt.println(l2)

	l3 := length([3]f32{1.0,2.0,3.0})
	fmt.println(l3)
	fmt.sqr2d()
}