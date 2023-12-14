//TRIGGERS
#region NEW GAME
if newGameFlag { startGame() }
#endregion
#region END GAME
if endGameFlag { endGame() }
#endregion

//GLOBAL ROOM INPUT
#region SETTINGS
if keyboard_check_pressed(vk_f5) {
	var stateFullscreen = window_get_fullscreen()
	window_set_fullscreen(!stateFullscreen)
}
#endregion
#region OTHER
if keyboard_check_pressed(vk_f4) {
    global.debugMode *= -1 
}
#endregion

//LOCAL ROOM INPUT
#region MENU
if room == room_menu {
	if keyboard_check_pressed(vk_space) {
		show_debug_message("space activate")
		newGameFlag = true
		room_goto(room_arena)
	}
	
	if keyboard_check_pressed(vk_escape) {
		game_end()
	}
}
#endregion
#region ARENA
if room == room_arena {
	
	if keyboard_check_pressed(ord("R")) {
		newGameFlag = true
		room_restart()
	}

	if keyboard_check_pressed(vk_escape) {
		room_goto(room_menu)
	}
	
	if keyboard_check_pressed(vk_backspace) && instance_exists(obj_player) {
		endGameFlag = true
	}
}
#endregion
#region HIGHSCORE
if room == room_highscore {

	if keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_escape) {
		room_goto(room_menu)
	}

}
#endregion