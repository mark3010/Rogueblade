event_inherited()

// DEBUG MODE
global.debugMode = -1
global.instanceIDCounter = 0
global.gameActive = false

enum gameModeType {
	NORMAL,
	PRACTICE
}

//CREATE GAME
newGameFlag = false
endGameFlag = false
gameMode = gameModeType.PRACTICE

/*
function startGame(gameMode) {
	gameInitializer = instance_create_depth(x,y,depth,obj_gameinit)
	gameInitializer.createGame(gameMode)
	
	newGameFlag = false
	global.gameActive = true
	
}

function endGame() {
	gameEnder = instance_create_depth(x,y,depth,obj_game_end_sequence)
	endGameFlag = false
	global.gameActive = false
	audio_stop_sound(snd_music)
}*/

//startGame(gameModeType.PRACTICE)