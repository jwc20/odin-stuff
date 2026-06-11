package grid_arena

import "core:fmt"

// ---------------------------------------------

MAP_WIDTH :: 10
MAP_HEIGHT :: 4

Position :: [2]int

Player :: struct {
	health: int,
	gold: int, 
	position: Position,
}

Entity :: struct {
	id: int,
	position: Position,
	symbol: rune,
}

// ---------------------------------------------

render_world :: proc(world: []u8) {
	for n, i in world {
		if i % 10 == 0 {
			fmt.print("\n")
		}
		fmt.printf("%c", n)
	}
	fmt.print("\n")
}

get_world_index :: proc(position: Position) -> int {
	row := MAP_HEIGHT - 1 - position.y
	col := position.x
	return row * MAP_WIDTH + col
}


place_player :: proc(world: []u8, player_index: int) -> []u8 {
	world[player_index] = 'P'
	return world
}


make_world :: proc(width, height: int) -> []u8 {
	world := make([]u8, width * height)
	for i := 0; i < len(world); i += 1 {
		world[i] = '.'
	}	
	return world
}

// ---------------------------------------------

main :: proc() {
	world_string := make_world(MAP_WIDTH, MAP_HEIGHT)
	render_world(world_string)

	current_position := [2]int {3,3}
	my_player := Player{
		health = 100,
		position = current_position,
	}

	player_world_index := get_world_index(current_position)
	place_player(world_string, player_world_index)
	render_world(world_string)


	// fmt.printfln("Health: %i", my_player.health)
	// fmt.printfln("Gold: %i", my_player.gold)
}