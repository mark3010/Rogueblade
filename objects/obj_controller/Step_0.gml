
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
		audio_play_sound(snd_ui_select, 10, false)
		var transition = instance_create_layer(x,y,layer,obj_room_transition)
		transition.targetRoom = room_arena
		if instance_exists(obj_cam) {obj_cam.zoomOut()}
	}
	
	if keyboard_check_pressed(vk_escape) {
		game_end()
	}
	
	if keyboard_check_pressed(ord("R")) {
		room_restart()
	}
}
#endregion
#region ARENA
if room == room_arena {

	if keyboard_check_pressed(vk_escape) {
		audio_play_sound(snd_ui_select, 10, false)
		audio_stop_sound(snd_music)
		var transition = instance_create_layer(x,y,layer,obj_room_transition)
		transition.targetRoom = room_menu
		if instance_exists(obj_cam) {obj_cam.zoomOut()}
	}
	
	if keyboard_check_pressed(ord("R")) && global.debugMode {
		room_restart()
	}
	
	if keyboard_check_pressed(vk_backspace) && instance_exists(obj_player) && global.debugMode {
		obj_gameinit.player.deathFlag = true
	}
	
	if keyboard_check_pressed(vk_space) {
		if instance_exists(obj_player) {
			instance_deactivate_layer(layer_get_id("layerEntities"))
			instance_deactivate_layer(layer_get_id("layerBackground"))
			show_debug_message("pause")
		} else {
			instance_activate_layer(layer_get_id("layerEntities"))
			instance_activate_layer(layer_get_id("layerBackground"))
			show_debug_message("unpause")
		}
	}
	
	if keyboard_check_pressed(ord("R")) {
		room_restart()
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