/// @description Insert description here
// You can write your code in this editor

//SAVE DATA
//data file structure
var dataImprint = {
	timer : {
		gameTime : obj_timer.gameTime,
		gameTime10MS : obj_timer.gameTime10MS,
		gameTimeS : obj_timer.gameTimeS,
		gameTimeM : obj_timer.gameTimeM,
		gameTimeH : obj_timer.gameTimeH
		},
	player : {
		life : obj_player.maxLife
		},
	wave : obj_wave_director.waveList
}

//data file object
saveFile = instance_create_depth(x,y,depth,obj_save_file)
saveFile.data = dataImprint

//END GAME SEQUENCE
instance_destroy(obj_player)
alarm_set(0,240) // alarm 0 is go to highscore room