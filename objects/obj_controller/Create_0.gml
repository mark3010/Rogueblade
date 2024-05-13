event_inherited()
global.font=font_silver
global.fontDebug=font_silkscreen
global.version="RogueBlade - v0.01"
gameMode = gameModeType.PRACTICE
pauseScreen = -1
pauseScreenLight = -1
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