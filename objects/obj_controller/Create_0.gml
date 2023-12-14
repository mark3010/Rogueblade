event_inherited()

// DEBUG MODE
global.debugMode = -1
global.instanceIDCounter = 0
global.gameActive = false

//CREATE GAME
newGameFlag = false
endGameFlag = false

function startGame() {
	gameInitializer = instance_create_depth(x,y,depth,obj_gameinit)
	newGameFlag = false
	global.gameActive = true
}

function endGame() {
	gameEnder = instance_create_depth(x,y,depth,obj_game_end_sequence)
	endGameFlag = false
	global.gameActive = false
}