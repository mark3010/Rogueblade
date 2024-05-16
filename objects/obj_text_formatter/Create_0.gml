/// @description Insert description here
// You can write your code in this editor

//STATS
function formatStats(stats) {
	var allStats = {}
	var s = variable_struct_get_names(stats)
	
	var f = ""
	if array_contains(s,"maxLife") {f += "> Life: "+string(stats.maxLife)+"\n"}
	if array_contains(s,"lifeRegen") {f += "> Life regeneration: "+string(stats.lifeRegen)+"\n"}
	if array_contains(s,"maxTriggers") {f += "> Shield triggers: "+string(stats.maxTriggers)+"\n"}
	if array_contains(s,"maxTriggersCooldown") {f += "> Shield trigger cooldown: "+string(stats.maxTriggersCooldown/60)+" s.\n"}
	
	/*
	//movement
	deflectionPower : 100,
	deflectionResistance : 100,
	velMax : 4,					//VELOCITY - max speed before drag is applied
	maxTriggersCooldown : 0,	//SECONDS 
	triggersCooldownRegen : 1,	
	zGravity : 40,				//PIXELS/SECOND
	zBounciness : 50,			//PERCENTAGE - 100% means bounce with no loss, 0% means no bouncy at all
	acc : 0.2,					//PIXEL/TICK - acceleration
	dashStrength : 1,
	dashChargeRate : 1,			
	dashResistance : 80,		//% damage resistance
	//weapon
	attacksPerSecond : 6,
	recoil :	.16				//measured in 1/100 of velocity
	*/
	return f
}

//TIME
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