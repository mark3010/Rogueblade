randomize() //set random seed to randomize gameplay

function createGame(gameModeType) {

	var arenaX = view_wport[0] / 2
	var arenaY = view_hport[0] / 2
	
	arena = instance_create_depth(arenaX,arenaY,depth,obj_arena)
	arena.init(gameModeType)
	
	switch (gameModeType) {
		case gameModeType.NORMAL:
			camera = instance_create_depth(arena.x,arena.y,depth,obj_cam)
			player = instance_create_depth(arena.x,arena.y,depth,obj_player)
			waveDirector = instance_create_depth(x,y,depth,obj_wave_director)
			timer = instance_create_depth(x,y,depth,obj_timer)
			upgradeHandler = instance_create_depth(x,y,depth,obj_upgrade_handler)
			
			audio_play_sound(snd_music, 1, true)
		break
		case gameModeType.PRACTICE:
			camera = instance_create_depth(arena.x,arena.y,depth,obj_cam)
			player = instance_create_depth(arena.x,arena.y,depth,obj_player)
		break
	}
	
	
	camera.focus(player.id)
}