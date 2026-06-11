package grid_arena

import "core:fmt"

MAP_WIDTH := 10
MAP_HEIGHT := 4




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
	/*
	In the 10x4 grid:

	..........
	..........
	..........
	..........

	want to place the player at the position.

	if the position is {3,3}, then the world should update to 

	...P......
	..........
	..........
	..........

	assuming the grid is a cartesian grid

	the left and bottom most position is (0,0)
	we want to place the `P` at the position.
	we want to replace the previous position with `.`

	Idea:
		- Finding the origin in the world string grid:
			- need to calculate the origin (0,0) with the world map width and height using the world string.
			- if MAP_WIDTH = 10 and MAP_HEIGHT = 4 (the length is 40), then the origin is at index = 31 of the world string.
			- if MAP_WIDTH = 3 and MAP_HEIGHT = 3, then origin is at index = 7
			
			- The formula is:
				- origin_index = (MAP_HEIGHT - 1) * MAP_WIDTH + 1

		- placing the player:
			- if the position = {3, 3}, then the current player position index in the world string = 22
				- calculate position x in the world string
					- origin_index += 3
				- calculate position y in the world string
					- 

	*/

	fmt.printfln("Player position: [%i, %i]", position.x, position.y)

	row := MAP_HEIGHT - 1 - position.y
	col := position.x


	return row * MAP_WIDTH + col
}


place_player :: proc(world: []u8, player_index: int) -> []u8 {
	world[player_index] = 'P'
	fmt.println(world)
	return world
}


make_world :: proc(width, height: int) -> []u8 {
	world := make([]u8, width * height)
	for i := 0; i < len(world); i += 1 {
		world[i] = '.'
	}	
	return world
}



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


	fmt.printfln("Health: %i", my_player.health)
	fmt.printfln("Gold: %i", my_player.gold)
}