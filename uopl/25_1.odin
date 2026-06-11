package game

import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(1280, 720, "Raylib Game")
	rl.SetTargetFPS(120)
	
	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLUE)
		rl.EndDrawing()
	}

	rl.CloseWindow()
}