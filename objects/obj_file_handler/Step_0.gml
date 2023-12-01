//TRIGGERS
#region NEW GAME
if newGameFlag {
	show_debug_message("new game made")
	instance_create_depth(x,y,depth,obj_gameinit)
	newGameFlag = false
}
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
}
#endregion
#region ARENA
if room == room_arena {
	
	if keyboard_check_pressed(ord("R")) {
		newGameFlag = true
		room_restart()
		
	}

}
#endregion
#region HIGHSCORE
if room == room_highscore {

}
#endregion