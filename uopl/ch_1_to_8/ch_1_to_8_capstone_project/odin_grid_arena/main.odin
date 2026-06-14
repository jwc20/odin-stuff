package grid_arena

import "core:fmt"
import "core:os"
import "core:strings"
import "core:math/rand"

// ---------------------------------------------

MAP_WIDTH :: 10
MAP_HEIGHT :: 4
MAX_ENEMIES :: 3


Position :: [2]int

Entity :: struct {
	id: int,
	position: Position,
	symbol: rune,
	attack: int,
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

Enemy :: struct {
	using entity: Entity,
	health: int,
}

World :: struct {
	tiles: [MAP_HEIGHT][MAP_WIDTH]Tile,
	enemies: [dynamic; MAX_ENEMIES]Enemy,
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
	move_enemies_randomly(world)
	place_entity(world)
}

move_enemies_randomly :: proc(world: ^World) {
	for &en in world.enemies {
		new_pos := en.entity.position

		choice := rand.choice([]int{0, 1})

		if choice == 0 {
			new_pos.x += rand.choice([]int{-1, 1})
		} else {
			new_pos.y += rand.choice([]int{-1, 1})
		}

		if new_pos.x >= 0 && new_pos.x < MAP_WIDTH &&
		   new_pos.y >= 0 && new_pos.y < MAP_HEIGHT {
			en.entity.position = new_pos
		}
	}
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

clear_world :: proc(world: ^World) {
	for i := 0; i < len(world.str); i += 1 {
		world.str[i] = '.'
	}
}

place_entity :: proc(world: ^World) {
	clear_world(world)
	for enemy in world.enemies {
		enemy_index := get_world_index(enemy.entity.position)
		world.str[enemy_index] = u8(enemy.symbol)
	}
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


attack_enemy :: proc(enemy: ^Enemy, damage: int) {

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
		attack = 10,
	}
	my_world := World {
		player = my_player,
		turn = 0,
		str = world_str,
	}

	append(&my_world.enemies, Enemy{
		entity = {
			position = {MAP_WIDTH - 1, MAP_HEIGHT - 1},
			symbol = 'X',
		},
		health = 100,
		attack = 5,
	})

	append(&my_world.enemies, Enemy{
		entity = {
			position = {MAP_WIDTH / 2, MAP_HEIGHT - 1},
			symbol = 'X',
		},
		health = 100,
		attack = 2,
	})

	append(&my_world.enemies, Enemy{
		entity = {
			position = {MAP_WIDTH / 3, MAP_HEIGHT - 4},
			symbol = 'X',
		},
		health = 100,
		attack = 3,
	})

	// -------------------------------

	place_entity(&my_world)
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
