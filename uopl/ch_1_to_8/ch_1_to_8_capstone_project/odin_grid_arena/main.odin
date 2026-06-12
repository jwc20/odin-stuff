package grid_arena

import "core:fmt"
import "core:os"
import "core:strings"

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

Tile :: enum {
	Floor,
	Wall,
}

World :: struct {
	tiles: [MAP_HEIGHT][MAP_WIDTH]Tile,
	// enemies: [dynamic; MAX_ENEMIES]Enemy,
	// items: [dynamic; MAX_ITEMS]Item,
	player: Player,
	turn: int,
	str: []u8,
}

// ---------------------------------------------


handle_player_turn :: proc(world: ^World, command: string) {
	fmt.println(world.player.entity.position)

	player_index := get_world_index(world.player.entity.position)
	world.str[player_index] = u8('.')
	
	switch command {
	case "w": 
		world.player.entity.position.y -= 1
	case "s": 
		world.player.entity.position.y += 1
	case "d": 
		world.player.entity.position.x += 1
	case "a": 	
		world.player.entity.position.x -= 1
	}
	place_player(world)
}

render_world :: proc(world: World) {
	for tile, index in world.str {
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

place_player :: proc(world: ^World) {
	player_index := get_world_index(world.player.entity.position)
	world.str[player_index] = u8(world.player.symbol)
}

make_world :: proc(width, height: int) -> []u8 {
	world := make([]u8, width * height)
	for i := 0; i < len(world); i += 1 {
		world[i] = '.'
	}	
	return world
}

read_commands :: proc() -> []u8 {
	buf: [256]byte
	fmt.print("\n")
	fmt.print("Enter command: ")
	n, err := os.read(os.stdin, buf[:])
	if err != nil {
		fmt.eprintln("Error reading: ", err)
	}
	result := buf[:n]
	return result
}

can_move_to :: proc(world: World, command: string) -> bool {
	x := world.player.entity.position.x
	y := world.player.entity.position.y

	switch command {
	case "w":
		y -= 1
	case "s":
		y += 1
	case "d":
		x += 1
	case "a":
		x -= 1
	}

	return x >= 0 && x < MAP_WIDTH &&
	       y >= 0 && y < MAP_HEIGHT
}

// ---------------------------------------------

main :: proc() {
	world_str := make_world(MAP_WIDTH, MAP_HEIGHT) // make this into a constructor
	my_player := Player{
		entity = {
			position = {0, 0},
			symbol = 'P',
		},
		health = 100,
	}
	my_world := World {
		player = my_player,
		turn = 0,
		str = world_str,
	}

	place_player(&my_world)
	render_world(my_world)

	command: []u8
	buf: [256]byte
	
	for {
		fmt.print("\n")
		fmt.print("Enter command (wasd): ")
		n, _ := os.read(os.stdin, buf[:])

		command := strings.trim_space(string(buf[:n]))

		if command == "q" {
			break
		}

		if !can_move_to(my_world, command) {
			fmt.println("out of boundary")
			continue
		}

		handle_player_turn(&my_world, command)
		render_world(my_world)
	}
}
