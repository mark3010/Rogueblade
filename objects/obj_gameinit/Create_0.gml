randomize() //set random seed to randomize gameplay
global.gameStartDelay = true

function endGame() {
	gameEnder = instance_create_layer(x,y,layer,obj_game_end_sequence)
	global.gameActive = false
	audio_play_sound(snd_player_death, 1, false)
	audio_stop_sound(snd_music)
}

function createGame(gameModeType) {

	var arenaX = view_wport[0] / 2
	var arenaY = view_hport[0] / 2
	
	layerEntities = layer_create(0,"layerEntities")
	layerGround = layer_create(1,"layerGround")
	layerBackground = layer_create(2,"layerBackground")
	layerPause = layer_create(-1,"layerPause")

	arena = instance_create_layer(arenaX,arenaY,layerBackground,obj_arena)
	arena.init(gameModeType)
	arenaLight = instance_create_layer(arenaX,arenaY,layerBackground,obj_spotlight)
	arenaLightShaft = instance_create_layer(arenaX,arenaY,layerBackground,obj_shaftlight)
	atmosphere = instance_create_layer(arenaX,arenaY,layerBackground,obj_atmosphere)
	
	var directionRandom = irandom(359)
	var directionDistance = 2
	var playerXOffset = lengthdir_x(directionDistance, directionRandom)
	var playerYOffset = lengthdir_y(directionDistance, directionRandom)
	playerXSpawn = arena.x+playerXOffset
	playerYSpawn = arena.y+playerYOffset

	switch (gameModeType) {
		case gameModeType.NORMAL:
			gui = instance_create_layer(x,y,layerEntities,obj_gui)
			camera = instance_create_layer(arena.x,arena.y+200,layerEntities,obj_cam)
			camera.focus(arena.id)
			alarm_set(0,180*global.gameStartDelay) //spawn player
			alarm_set(1,360*global.gameStartDelay) //spawn arena tools
			skills = instance_create_layer(x,y,layerPause,obj_skillsystem_init)
			instance_deactivate_layer(layerPause)
			
			audio_play_sound(snd_music, 1, true)
		break
		case gameModeType.PRACTICE:
			gui = instance_create_layer(x,y,layerEntities,obj_gui)
			camera = instance_create_layer(arena.x,arena.y+200,layerEntities,obj_cam)
			camera.focus(arena.id)
			if global.gameFirstLoad {
				alarm_set(0,180*global.gameStartDelay) //spawn player
			} else {
				alarm_set(0,1) //spawn player
			}
			arenaLight.lightXScale= .45
			arenaLight.lightYScale= .45
			arenaLightShaft.lightXScale= .45
			arenaLightShaft.lightYScale= .45
		break
	}
	
	global.gameActive = true
	//camera.focus(player.id)
}

function loadPlayer(creationLayer) {
	//playerModder = instance_create_depth(playerXSpawn,playerYSpawn,-9999,obj_player_modder)
	//player = instance_create_layer(playerXSpawn,playerYSpawn,creationLayer,obj_player)
	
	//var saveData = obj_file_handler.getProgress()
	
	//player.core = playerModder.getModel(saveData.blade.core)
	//player.hull = playerModder.getModel(saveData.blade.hull)
	//player.anchor = playerModder.getModel(saveData.blade.anchor)
}