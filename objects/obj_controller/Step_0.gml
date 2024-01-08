//TRIGGERS
#region NEW GAME
//if newGameFlag { startGame(gameMode) }
#endregion

#region END GAME
//if endGameFlag { 
	//endGame() 
	//audio_play_sound(snd_player_death, 1, false)
	//}
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
	show_debug_message("F4")
}
#endregion

//LOCAL ROOM INPUT
#region MENU
if room == room_menu {
	if keyboard_check_pressed(vk_space) {
		//newGameFlag = true
		//gameMode = gameModeType.NORMAL
		audio_play_sound(snd_ui_select, 10, false)
		room_goto(room_arena)
	}
	
	if keyboard_check_pressed(vk_escape) {
		game_end()
	}
}
#endregion
#region ARENA
if room == room_arena {

	if keyboard_check_pressed(vk_escape) {
		audio_play_sound(snd_ui_select, 10, false)
		audio_stop_sound(snd_music)
		room_goto(room_menu)
	}
	
	if keyboard_check_pressed(ord("R")) && global.debugMode {
		room_restart()
	}
	
	if keyboard_check_pressed(vk_backspace) && instance_exists(obj_player) && global.debugMode {
		obj_gameinit.player.deathFlag = true
	}
}

#endregion

#region HIGHSCORE
if room == room_highscore {
	if keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_escape) {
		//gameMode = gameModeType.PRACTICE
		//newGameFlag = true
		audio_play_sound(snd_ui_select, 10, false)
		room_goto(room_menu)
	}
}
#endregion