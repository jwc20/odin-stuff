package grid_arena

import "core:fmt"

// ---------------------------------------------

MAP_WIDTH :: 10
MAP_HEIGHT :: 4

Position :: [2]int

Entity :: struct {
	id: int,
	position: Position,
	symbol: rune,
}

Player :: struct {
	using entity: Entity,
	health: int,
	gold: int, 
}

// ---------------------------------------------

render_world :: proc(world: []u8) {
	for tile, index in world {
		if index != 0 && index % MAP_WIDTH == 0 {
			fmt.println()
		}

		fmt.printf("%c", tile)
	}

	fmt.println()
}

get_world_index :: proc(position: Position) -> int {
	row := position.y
	col := position.x
	return row * MAP_WIDTH + col
}


place_player :: proc(world: []u8, player: Player, player_index: int) {
	world[player_index] = u8(player.symbol)
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
	fmt.printfln("\n")

	my_player := Player{
		entity = {
			position = {3, 3},
			symbol = 'P',
		},
		health = 100,
	}

	player_world_index := get_world_index(my_player.entity.position)
	place_player(world_string, my_player, player_world_index)
	render_world(world_string)


	// fmt.printfln("Health: %i", my_player.health)
	// fmt.printfln("Gold: %i", my_player.gold)
}
