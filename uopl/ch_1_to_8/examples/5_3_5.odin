package uopl

import "core:fmt"


Texture :: struct {

}

Entity ::  struct {
	position: [2]f32,
	texture: Texture,
	variant: Entity_Variant,
}

Entity_Player :: struct {
	can_jump: bool, 
}

Entity_Rocket :: struct {
	time_in_space: f32,
}

Entity_Variant :: union {
	Entity_Player,
	Entity_Rocket,
}


main :: proc() {
	starting_position := [2]f32{123.1, 15.2}
	player_graphic := Texture {}

	player_entity := Entity {
		position = starting_position,
		texture = player_graphic,
		variant = Entity_Player {
			can_jump = true,
		}
	}

	fmt.println(player_entity)
}