/// @description Insert description here
// You can write your code in this editor

function gameTime10MS(gameTime) {
	return floor(gameTime * 1.666 mod 100)
}

function gameTimeS(gameTime) {
	return floor(gameTime/60 mod 60)
}

function gameTimeM(gameTime) {
	return floor(gameTime/(60*60) mod 60)
}

function gameTimeH(gameTime) {
	return floor(gameTime/(60*60*60))
}

function gameTimeFormatted(gameTime) {
	var timeFormatted = ""
	if gameTimeH(gameTime) > 0 {
		timeFormatted += string(gameTimeM(gameTime)) + " h. " 
	}
	if gameTimeM(gameTime) > 0 {
		timeFormatted += string(gameTimeM(gameTime)) + " m. " 
	}
	if gameTimeS(gameTime) >= 0 {
		timeFormatted += string(gameTimeS(gameTime)) + " s. " 
	}
	
	return timeFormatted
}