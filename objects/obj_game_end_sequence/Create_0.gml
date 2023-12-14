/// @description Insert description here
// You can write your code in this editor

//SAVE DATA
//data file structure
var dataImprint = {
	timer : {
		gameTime : obj_timer.gameTime,
		gameTime10MS : obj_timer.gameTime10MS(),
		gameTimeS : obj_timer.gameTimeS(),
		gameTimeM : obj_timer.gameTimeM(),
		gameTimeH : obj_timer.gameTimeH()
		},
	player : {
		life : obj_player.maxLife
		},
	wave : obj_wave_director.waveList
}

//data file object
saveFile = instance_create_depth(x,y,depth,obj_save_score_snapshot)
saveFile.data = dataImprint

//END GAME SEQUENCE
instance_destroy(obj_player)
alarm_set(0,360) // alarm 0 is go to highscore room
alarm_set(1,60) // alarm 1 is to show overlay
alarm_set(2,90) // alarm 2 is to show overlay1 text
alarm_set(3,120) // alarm 3 is to show overlay2 text

//ANIMATION
overlayAlpha = 0
overlayFlag = false

overlayText1Alpha = 0
overlayText1Flag = false

overlayText2Alpha = 0
overlayText2Flag = false