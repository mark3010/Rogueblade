
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
if keyboard_check_pressed(vk_f1) {
    global.renderMode *= -1 
}
#endregion

//LOCAL ROOM INPUT
#region MENU
if room == room_menu {
	if keyboard_check_pressed(vk_space) {
		//startRun()
	}
	
	if keyboard_check_pressed(vk_escape) {
		//game_end()
	}
	
	if keyboard_check_pressed(ord("R")) {
		room_restart()
	}
}
#endregion
#region ARENA
if room == room_arena {

	if keyboard_check_pressed(vk_escape) {
		if sprite_exists(pauseScreen) {sprite_delete(pauseScreen)}
		if sprite_exists(pauseScreenLight) {sprite_delete(pauseScreenLight)}
		if instance_exists(obj_arena) {
			//go to menu
			audio_play_sound(snd_ui_select, 10, false)
			audio_stop_sound(snd_music)
			var transition = instance_create_layer(x,y,layer,obj_room_transition)
			transition.targetRoom = room_menu
			if instance_exists(obj_cam) {obj_cam.zoomOut()}
			global.inputHighjack = true
			
		} else {
			unpause()
		}
	}
	
	if keyboard_check_pressed(vk_backspace) && instance_exists(obj_player) && global.debugMode {
		obj_gameinit.player.deathFlag = true
	}
	
	if keyboard_check_pressed(vk_tab) && instance_exists(obj_player) {
		obj_player.EXP = obj_player.EXPCapList[obj_player.level-1]
	}
	
	
	if keyboard_check_pressed(ord("E")) {
		if instance_exists(obj_player) {
			pause()
		} else {
			unpause()
		}
	}
}


#endregion

#region HIGHSCORE
if room == room_highscore {
	if keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_escape) {
		audio_play_sound(snd_ui_select, 10, false)
		var transition = instance_create_layer(x,y,layer,obj_room_transition)
		transition.targetRoom = room_menu
	}
}
#endregion