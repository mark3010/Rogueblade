randomize() //set random seed to randomize gameplay

function endGame() {
	gameEnder = instance_create_layer(x,y,layer,obj_game_end_sequence)
	global.gameActive = false
	audio_play_sound(snd_player_death, 1, false)
	audio_stop_sound(snd_music)
}

function createGame(gameModeType) {

	var arenaX = view_wport[0] / 2
	var arenaY = view_hport[0] / 2
	
	var layerEntities = layer_create(0,"layerEntities")
	var layerGround = layer_create(1,"layerGround")
	var layerBackground = layer_create(2,"layerBackground")

	arena = instance_create_layer(arenaX,arenaY,layerBackground,obj_arena)
	arena.init(gameModeType)
	arenaLight = instance_create_layer(arenaX,arenaY,layerBackground,obj_spotlight)
	arenaLightShaft = instance_create_layer(arenaX,arenaY,layerBackground,obj_shaftlight)
	
	var directionRandom = irandom(359)
	var directionDistance = 2
	var playerXOffset = lengthdir_x(directionDistance, directionRandom)
	var playerYOffset = lengthdir_y(directionDistance, directionRandom)
	var playerXSpawn = arena.x+playerXOffset
	var playerYSpawn = arena.y+playerYOffset

	switch (gameModeType) {
		case gameModeType.NORMAL:
			gui = instance_create_layer(x,y,layerEntities,obj_gui)
			camera = instance_create_layer(arena.x,arena.y,layerEntities,obj_cam)
			player = instance_create_layer(playerXSpawn,playerYSpawn,layerEntities,obj_player)
			waveDirector = instance_create_layer(x,y,layerEntities,obj_wave_director)
			timer = instance_create_layer(x,y,layerEntities,obj_timer)
			upgradeHandler = instance_create_layer(x,y,layerEntities,obj_upgrade_handler)
			
			audio_play_sound(snd_music, 1, true)
		break
		case gameModeType.PRACTICE:
			camera = instance_create_layer(arena.x,arena.y,layerEntities,obj_cam)
			player = instance_create_layer(playerXSpawn,playerYSpawn,layerEntities,obj_player)
		break
	}
	
	global.gameActive = true
	camera.focus(player.id)
}