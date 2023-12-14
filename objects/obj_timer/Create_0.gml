/// @description Insert description here
// You can write your code in this editor
gameTime = 0

function gameTime10MS() {
	return floor(gameTime * 1.666 mod 100)
}

function gameTimeS() {
	return floor(gameTime/60 mod 60)
}

function gameTimeM() {
	return floor(gameTime/(60*60) mod 60)
}

function gameTimeH() {
	return floor(gameTime/(60*60*60))
}