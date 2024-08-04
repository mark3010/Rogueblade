event_inherited()
global.font=font_silver
global.fontDebug=font_silkscreen
global.version="RogueBlade - v0.01"
global.gameFirstLoad = true //used to show first screen animation


gameMode = gameModeType.PRACTICE
pauseScreen = -1
pauseScreenLight = -1
darknessColorVar = 0
// DEBUG MODE
global.debugMode = -1
global.renderMode = -1
global.instanceIDCounter = 0
global.gameActive = false

enum gameModeType {
	NORMAL,
	PRACTICE
}


function startRun() {
	audio_play_sound(snd_ui_select, 10, false)
	var transition = instance_create_layer(x,y,layer,obj_room_transition)
	transition.targetRoom = room_arena
	if instance_exists(obj_cam) {obj_cam.zoomOut()}
}

function closeRun() {
	audio_play_sound(snd_ui_select, 10, false)
	audio_stop_sound(snd_music)
	var transition = instance_create_layer(x,y,layer,obj_room_transition)
	transition.targetRoom = room_menu
	if instance_exists(obj_cam) {obj_cam.zoomOut()}
	global.inputHighjack = true
}

function pause() {
	//generate pause sprite
	pauseScreen=sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0)
	var lightSurf = obj_draw_handler.light_surface
	pauseScreenLight=sprite_create_from_surface(lightSurf,0,0,surface_get_width(lightSurf),surface_get_height(lightSurf),0,1,0,0)
			
	instance_deactivate_layer(layer_get_id("layerEntities"))
	instance_deactivate_layer(layer_get_id("layerBackground"))
	instance_activate_layer(layer_get_id("layerPause"))
	obj_ui_selector.findStarterMenuOption()
}
function unpause() {
	if sprite_exists(pauseScreen) {sprite_delete(pauseScreen)}
	if sprite_exists(pauseScreenLight) {sprite_delete(pauseScreenLight)}
	obj_skilltree_generator.resetAnimations()
	instance_activate_layer(layer_get_id("layerEntities"))
	instance_activate_layer(layer_get_id("layerBackground"))
	instance_deactivate_layer(layer_get_id("layerPause"))
	obj_ui_selector.forget()
}