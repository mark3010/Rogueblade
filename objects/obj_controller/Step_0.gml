
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
		} else {
			//unpause
			instance_activate_layer(layer_get_id("layerEntities"))
			instance_activate_layer(layer_get_id("layerBackground"))
			instance_deactivate_layer(layer_get_id("layerPause"))
		}
	}
	
	if keyboard_check_pressed(ord("R")) && global.debugMode {
		room_restart()
	}
	
	if keyboard_check_pressed(vk_backspace) && instance_exists(obj_player) && global.debugMode {
		obj_gameinit.player.deathFlag = true
	}
	
	if keyboard_check_pressed(vk_space) {
		if instance_exists(obj_player) {
			
			//generate pause sprite
			pauseScreen=sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0)
			var lightSurf = obj_draw_handler.light_surface
			pauseScreenLight=sprite_create_from_surface(lightSurf,0,0,surface_get_width(lightSurf),surface_get_height(lightSurf),0,1,0,0)
			
			instance_deactivate_layer(layer_get_id("layerEntities"))
			instance_deactivate_layer(layer_get_id("layerBackground"))
			instance_activate_layer(layer_get_id("layerPause"))
		} else {
			if sprite_exists(pauseScreen) {sprite_delete(pauseScreen)}
			if sprite_exists(pauseScreenLight) {sprite_delete(pauseScreenLight)}
			instance_activate_layer(layer_get_id("layerEntities"))
			instance_activate_layer(layer_get_id("layerBackground"))
			instance_deactivate_layer(layer_get_id("layerPause"))

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