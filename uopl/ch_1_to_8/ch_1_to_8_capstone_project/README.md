# Odin Grid Arena: Chapters 1–8 Capstone Project

## Project Summary

Build a small **terminal-based grid combat simulator** in Odin.

You will create a tiny game where a player moves around a 2D grid, collects items, fights enemies, and prints the state of the world each turn.

This project is designed to be comprehensive for chapters 1–8 of the Odin book. It gives you practice with the core ideas from the early chapters:

```text
packages
imports
main procedure
variables
constants
basic types
casts
procedures
if statements
for loops
fixed arrays
structs
using
enums
switch
unions
Maybe
pointers
addressables
procedure parameters
return values
scope
stack memory
defer
fixed-capacity dynamic arrays
array programming with [2]int or [2]f32
```

The goal is not to build a huge game. The goal is to build a focused project that makes you use Odin's fundamentals together in one program.

---

## Example Output

Your program should eventually print something like this:

```text
==== ODIN GRID ARENA ====

Turn: 4

##########
#..E.....#
#........#
#...P....#
#.....I..#
##########

Player:
Health: 85
Gold: 10
Position: [3, 3]

Command:
w = up
s = down
a = left
d = right
q = quit
```

The player can move around the map. Enemies exist on the map. Items can be picked up. Each turn, the program prints the updated game state.

This is a **terminal project**, not a graphics project. That keeps the focus on the Odin language itself.

---

## What This Project Teaches

The main lesson is:

> Use Odin's basic language tools to model a small world: structs for data, enums for categories, unions for variant data, procedures for behavior, pointers for mutation, and arrays for fixed-size storage.

This project helps you practice the early Odin style:

```text
Data lives in structs.
Behavior lives in procedures.
Use pointers when you want mutation.
Use value parameters when you only need to read.
Use fixed arrays and fixed-capacity dynamic arrays before dynamic allocation.
```

---

## Suggested File Structure

Start with one file:

```text
odin_grid_arena/
	main.odin
```

Run it with:

```bash
odin run .
```

Later, after the program grows, split it into multiple files:

```text
odin_grid_arena/
	main.odin
	types.odin
	world.odin
	combat.odin
	render.odin
```

Every file in the same folder should use the same package name:

```odin
package grid_arena
```

---

# Core Data Types

## Position Type

Use a fixed array for 2D positions:

```odin
Position :: [2]int
```

Example:

```odin
pos := Position{3, 4}
move := Position{1, 0}

pos += move
```

This helps you practice fixed arrays and array programming.

---

## Entity Base Struct

Use an `Entity` struct for shared entity data:

```odin
Entity :: struct {
	id: int,
	position: Position,
	symbol: rune,
}
```

Then embed it into `Player` and `Enemy` using `using`.

```odin
Player :: struct {
	using entity: Entity,
	health: int,
	gold: int,
}
```

```odin
Enemy :: struct {
	using entity: Entity,
	health: int,
	damage: int,
	kind: Enemy_Kind,
}
```

This covers:

```text
structs
nested structs
using on struct fields
zero initialization
designated initializers
```

---

## Enums for Categories

Use enums for fixed categories.

```odin
Enemy_Kind :: enum {
	Slime,
	Goblin,
	Orc,
}
```

```odin
Tile :: enum {
	Floor,
	Wall,
}
```

Example procedure using `switch`:

```odin
enemy_damage :: proc(kind: Enemy_Kind) -> int {
	switch kind {
	case .Slime:
		return 5
	case .Goblin:
		return 10
	case .Orc:
		return 15
	}

	return 0
}
```

This covers:

```text
enums
switch
complete enum handling
return values
```

---

## Union for Item Types

Different items should hold different data.

```odin
Potion :: struct {
	heal_amount: int,
}

Gold :: struct {
	amount: int,
}

Weapon :: struct {
	damage_bonus: int,
}
```

Use a union to represent item data:

```odin
Item_Data :: union {
	Potion,
	Gold,
	Weapon,
}
```

Then define an item:

```odin
Item :: struct {
	position: Position,
	name: string,
	data: Item_Data,
	active: bool,
}
```

Example item application:

```odin
apply_item :: proc(player: ^Player, item: ^Item) {
	switch value in item.data {
	case Potion:
		player.health += value.heal_amount

	case Gold:
		player.gold += value.amount

	case Weapon:
		// Simple placeholder effect:
		player.health += value.damage_bonus
	}

	item.active = false
}
```

This covers:

```text
unions
union variants
switch with unions
pointers for mutation
structs with variant data
```

---

# Main Project Constants

Use constants for fixed game settings:

```odin
MAP_WIDTH  :: 10
MAP_HEIGHT :: 6
MAX_ENEMIES :: 8
MAX_ITEMS   :: 16
```

These use `::`, meaning they are compile-time declarations.

---

# World Storage

Use fixed arrays and fixed-capacity dynamic arrays.

```odin
World :: struct {
	tiles: [MAP_HEIGHT][MAP_WIDTH]Tile,
	enemies: [dynamic; MAX_ENEMIES]Enemy,
	items: [dynamic; MAX_ITEMS]Item,
	player: Player,
	turn: int,
}
```

This gives you practice with:

```text
fixed arrays
fixed-capacity dynamic arrays
struct fields
stack memory
array storage
append
```

---

# Main Program Loop

Your `main` procedure should eventually look roughly like this:

```odin
package grid_arena

import "core:fmt"

main :: proc() {
	world := make_world()
	defer fmt.println("Thanks for playing Odin Grid Arena!")

	for {
		render_world(world)

		command := read_command()

		if command == 'q' {
			break
		}

		handle_player_turn(&world, command)
		handle_enemy_turns(&world)

		world.turn += 1

		if world.player.health <= 0 {
			fmt.println("You died!")
			break
		}
	}
}
```

This covers:

```text
main procedure
imports
for loop
break
if statements
procedure calls
pointer arguments
defer
scope
stack lifetime
```

---

# Important Procedures to Implement

## 1. Create the World

```odin
make_world :: proc() -> World {
	world: World

	world.player = Player {
		entity = {
			id = 1,
			position = {3, 3},
			symbol = 'P',
		},
		health = 100,
		gold = 0,
	}

	append(&world.enemies, Enemy {
		entity = {
			id = 2,
			position = {4, 1},
			symbol = 'E',
		},
		health = 30,
		damage = 8,
		kind = .Goblin,
	})

	append(&world.items, Item {
		position = {6, 4},
		name = "Small Potion",
		data = Potion{heal_amount = 20},
		active = true,
	})

	return world
}
```

This uses:

```text
zero initialization
struct literals
designated initializers
nested initialization
append with fixed-capacity dynamic arrays
returning structs by value
```

---

## 2. Render the World

```odin
render_world :: proc(world: World) {
	fmt.printfln("Turn: %v", world.turn)
	fmt.printfln("Health: %v | Gold: %v", world.player.health, world.player.gold)

	for y in 0..<MAP_HEIGHT {
		for x in 0..<MAP_WIDTH {
			pos := Position{x, y}

			if world.player.position == pos {
				fmt.print("P")
			} else if enemy_at(world, pos) {
				fmt.print("E")
			} else if item_at(world, pos) {
				fmt.print("I")
			} else {
				fmt.print(".")
			}
		}

		fmt.println()
	}
}
```

Notice that this takes:

```odin
world: World
```

not:

```odin
world: ^World
```

Why?

Because `render_world` only reads the world. It should not mutate it.

This applies the chapter 7 lesson:

> Do not use pointer parameters just for optimization.

---

## 3. Mutate the World with Pointers

Movement should mutate the original world.

```odin
handle_player_turn :: proc(world: ^World, command: rune) {
	move := Position{0, 0}

	switch command {
	case 'w':
		move = {0, -1}
	case 's':
		move = {0, 1}
	case 'a':
		move = {-1, 0}
	case 'd':
		move = {1, 0}
	case:
		fmt.println("Unknown command.")
		return
	}

	new_position := world.player.position + move

	if can_move_to(world^, new_position) {
		world.player.position = new_position
	}

	check_item_pickup(world)
	check_enemy_collision(world)
}
```

This covers:

```text
pointer parameters
dereferencing with ^
address-of with &
switch
rune commands
array programming with Position
```

---

## 4. Find an Enemy by Position

Advanced version using `Maybe(^Enemy)`:

```odin
find_enemy_at :: proc(world: ^World, position: Position) -> Maybe(^Enemy) {
	for &enemy in world.enemies {
		if enemy.position == position && enemy.health > 0 {
			return enemy
		}
	}

	return nil
}
```

This covers:

```text
Maybe
pointers
for loops
addressable loop values
returning nil
```

Simpler version:

```odin
enemy_at :: proc(world: World, position: Position) -> bool {
	for enemy in world.enemies {
		if enemy.position == position && enemy.health > 0 {
			return true
		}
	}

	return false
}
```

---

# Chapter-by-Chapter Coverage

## Chapter 1: Introduction and Odin Mindset

This project follows Odin's early philosophy:

```text
Simple code
No classes
Data in structs
Behavior in procedures
Manual control over memory layout
Terminal-based compiled program
```

The project should not be object-oriented. Do not create classes or fake methods. Use structs and separate procedures.

---

## Chapter 2: Tiny Program, Packages, Imports, Build/Run

Practice:

```text
package grid_arena
import "core:fmt"
main :: proc()
odin run .
odin build .
multiple Odin files in one folder
```

Run:

```bash
odin run .
```

Optional stricter build:

```bash
odin run . -vet -strict-style
```

---

## Chapter 3: Variables and Constants

Use:

```odin
health := 100
gold: int
speed: f32 = 1.0
MAP_WIDTH :: 10
```

Practice constants, variables, and casts:

```odin
damage := 7
speed: f32 = 7
speed = f32(damage)
```

This reinforces:

```text
constants
variables
type inference
casts
untyped integers
untyped floats
zero values
```

---

## Chapter 4: Procedures, If Statements, Loops, Fixed Arrays

Write procedures like:

```odin
can_move_to :: proc(world: World, position: Position) -> bool {
	x := position[0]
	y := position[1]

	if x < 0 || x >= MAP_WIDTH {
		return false
	}

	if y < 0 || y >= MAP_HEIGHT {
		return false
	}

	return world.tiles[y][x] != .Wall
}
```

Use loops:

```odin
for y in 0..<MAP_HEIGHT {
	for x in 0..<MAP_WIDTH {
		// draw tile
	}
}
```

This covers:

```text
procedures
return values
if / else
comparison operators
for loops
ranges
nested loops
fixed array indexing
```

---

## Chapter 5: Structs, Enums, Switch, Unions, Maybe

Use structs:

```odin
Player :: struct {
	using entity: Entity,
	health: int,
	gold: int,
}
```

Use enums:

```odin
Game_State :: enum {
	Playing,
	Won,
	Lost,
	Quit,
}
```

Use switch:

```odin
switch state {
case .Playing:
	fmt.println("Keep going.")
case .Won:
	fmt.println("You won!")
case .Lost:
	fmt.println("You lost.")
case .Quit:
	fmt.println("Goodbye.")
}
```

Use unions:

```odin
Item_Data :: union {
	Potion,
	Gold,
	Weapon,
}
```

Use Maybe:

```odin
maybe_enemy := find_enemy_at(&world, world.player.position)
```

---

## Chapter 6: Pointers and Addressables

Use pointers when a procedure needs to modify something:

```odin
damage_player :: proc(player: ^Player, amount: int) {
	player.health -= amount
}
```

Call it with:

```odin
damage_player(&world.player, 10)
```

Practice pointers to array elements:

```odin
enemy_pointer := &world.enemies[0]
enemy_pointer.health -= 10
```

Key rule:

```text
Use pointers when you want to mutate the original value.
Do not use pointers just because a value is large.
```

---

## Chapter 7: Procedures, Parameters, Scope, Stack, Defer

Practice:

```text
default parameters
named arguments
multiple return values
pointer parameters
read-only value parameters
scope
stack lifetime
defer
```

Default parameter:

```odin
log_message :: proc(message: string, label: string = "Info") {
	fmt.printfln("%v: %v", label, message)
}
```

Normal call:

```odin
log_message("Player moved.")
```

Named argument:

```odin
log_message("Player took damage.", label = "Combat")
```

Multiple return values:

```odin
parse_command :: proc(command: rune) -> (move: Position, ok: bool) {
	switch command {
	case 'w':
		return {0, -1}, true
	case 's':
		return {0, 1}, true
	case 'a':
		return {-1, 0}, true
	case 'd':
		return {1, 0}, true
	}

	return {}, false
}
```

Use `defer`:

```odin
main :: proc() {
	defer fmt.println("Program ended.")

	// game loop here
}
```

Stack safety reminder:

```odin
// Do not do this:
bad_pointer :: proc() -> ^int {
	number := 7
	return &number
}
```

The pointer would point to local stack memory that stops being valid after the procedure returns.

---

## Chapter 8: Fixed Arrays, Stack Memory, FCD Arrays, Array Programming

Use fixed-size storage:

```odin
tiles: [MAP_HEIGHT][MAP_WIDTH]Tile
```

Use fixed-capacity dynamic arrays:

```odin
enemies: [dynamic; MAX_ENEMIES]Enemy
items: [dynamic; MAX_ITEMS]Item
```

Use array programming:

```odin
position := Position{3, 3}
move := Position{1, 0}
position += move
```

Avoid giant local arrays:

```odin
// Bad idea: huge stack allocation
big_map: [1000000]int
```

Better for this project:

```odin
MAP_WIDTH :: 10
MAP_HEIGHT :: 6

tiles: [MAP_HEIGHT][MAP_WIDTH]Tile
```

---

# Development Milestones

## Milestone 1: Hello Grid

Goal: compile and print a map.

Build:

```text
package
import fmt
main procedure
MAP_WIDTH and MAP_HEIGHT constants
nested for loops
print grid
```

Example output:

```text
..........
..........
..........
..........
```

---

## Milestone 2: Add Player Data

Add:

```odin
Entity
Player
Position
```

Print:

```text
Player position: [3, 3]
Health: 100
Gold: 0
```

Concepts covered:

```text
structs
using
fixed arrays
constants
zero values
designated initializers
```

---

## Milestone 3: Draw the Player on the Grid

Add a render procedure:

```odin
render_world :: proc(world: World) {
	// print grid
}
```

The player appears as `P`.

Concepts covered:

```text
procedures
value parameters
loops
if statements
comparison
fixed array indexing
```

---

## Milestone 4: Move the Player

Add commands:

```text
w up
a left
s down
d right
q quit
```

Add:

```odin
handle_player_turn :: proc(world: ^World, command: rune)
```

Concepts covered:

```text
pointers
mutation
switch
runes
address-of &
dereference ^
```

---

## Milestone 5: Add Walls and Collision

Add map tiles:

```odin
Tile :: enum {
	Floor,
	Wall,
}
```

Add:

```odin
can_move_to :: proc(world: World, position: Position) -> bool
```

Concepts covered:

```text
enums
switch or if
bounds checking
return values
```

---

## Milestone 6: Add Enemies

Use:

```odin
enemies: [dynamic; MAX_ENEMIES]Enemy
```

Add enemies with:

```odin
append(&world.enemies, Enemy{...})
```

Concepts covered:

```text
fixed-capacity dynamic arrays
append
looping over arrays
pointer mutation
copying vs modifying original data
```

---

## Milestone 7: Combat

When the player touches an enemy, attack it.

```odin
attack_enemy :: proc(enemy: ^Enemy, damage: int) {
	enemy.health -= damage
}
```

If enemy health reaches zero:

```odin
enemy.symbol = 'x'
```

Concepts covered:

```text
pointer parameters for mutation
procedure naming
if statements
scope
stack-safe local variables
```

---

## Milestone 8: Items with Unions

Add potions, gold, and weapons.

```odin
Item_Data :: union {
	Potion,
	Gold,
	Weapon,
}
```

Apply them with:

```odin
switch value in item.data {
case Potion:
	player.health += value.heal_amount
case Gold:
	player.gold += value.amount
case Weapon:
	// apply weapon effect
}
```

Concepts covered:

```text
unions
union switch
variant data
struct composition
```

---

## Milestone 9: Maybe Return Values

Create functions that may or may not find something:

```odin
find_item_at :: proc(world: ^World, position: Position) -> Maybe(^Item)
find_enemy_at :: proc(world: ^World, position: Position) -> Maybe(^Enemy)
```

Concepts covered:

```text
Maybe
nil
optional result
safe lookup
pointers to elements
```

---

## Milestone 10: Demonstrate Stack and Copying

Add a debug procedure:

```odin
debug_array_copy :: proc() {
	a := [3]int{1, 2, 3}
	b := a

	b[0] = 99

	fmt.println(a) // [1, 2, 3]
	fmt.println(b) // [99, 2, 3]
}
```

This teaches:

```text
fixed arrays copy their contents
local arrays live on the stack
changing the copy does not change the original
```

---

# Full Topic Checklist

Use this as your project requirements list.

```markdown
- [ ] package declaration
- [ ] import core:fmt
- [ ] main procedure
- [ ] odin run .
- [ ] odin build .
- [ ] constants with ::
- [ ] variables with :=
- [ ] explicit variable types with :
- [ ] reassignment with =
- [ ] zero initialization
- [ ] basic types: int, f32, bool, string, rune
- [ ] casts like f32(value)
- [ ] untyped integer constants
- [ ] untyped float constants
- [ ] if / else if / else
- [ ] comparison operators
- [ ] && and ||
- [ ] ! boolean negation
- [ ] for loop forever
- [ ] for loop with range 0..<N
- [ ] nested loops
- [ ] break
- [ ] continue
- [ ] fixed arrays
- [ ] array indexing
- [ ] looping over arrays
- [ ] reverse loop, optional
- [ ] structs
- [ ] nested structs
- [ ] designated initializers
- [ ] using on struct fields
- [ ] enums
- [ ] switch on enum
- [ ] unions
- [ ] switch on union
- [ ] Maybe
- [ ] pointers with ^
- [ ] address-of with &
- [ ] pointer parameters for mutation
- [ ] value parameters for read-only data
- [ ] addressable array elements
- [ ] procedure parameters
- [ ] return values
- [ ] multiple return values
- [ ] default parameter values
- [ ] named arguments
- [ ] scope
- [ ] stack frame concept
- [ ] do not return pointer to local variable
- [ ] defer
- [ ] fixed arrays on stack
- [ ] avoid huge local arrays
- [ ] global fixed array, optional
- [ ] fixed-capacity dynamic arrays
- [ ] append
- [ ] unordered_remove or ordered_remove
- [ ] array programming with Position
```

---

# Practical Rule

Use this rule while building the project:

```text
Use structs to store game data.
Use procedures to operate on that data.
Use pointers only when the procedure should mutate the original value.
Use value parameters when the procedure only reads.
Use fixed arrays and fixed-capacity dynamic arrays before learning dynamic allocation.
Use enums for fixed categories.
Use unions when one value can be one of several data shapes.
```

---

# Simple Takeaway

Build **Odin Grid Arena** because it uses the early Odin book concepts in one complete program.

It is small enough to finish, but comprehensive enough to practice the real ideas from chapters 1–8:

> data, procedures, types, pointers, stack memory, fixed arrays, and simple control flow.
