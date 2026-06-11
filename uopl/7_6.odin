package uopl

import "core:fmt"

main :: proc() {
	// Read-only data
	show_info :: proc(player: Player) {
		// use player normally
	}

	// Modify original data
	take_damage :: proc(player: ^Player, amount: int) {
		player.health -= amount
	}

	// Need a snapshot copy
	some_proc :: proc(player: Player) {
		player := player // make real local copy
	}
}