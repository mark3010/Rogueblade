/// @description Insert description here
// You can write your code in this editor

event_inherited()

//BASE PLAYER STATS
function initPlayerStats() {
	//resources
	maxLife = 5
	currentLife = maxLife
	lifeRegen = 0.005
	
	maxTriggers = 3
	currentTriggers = maxTriggers
	maxTriggersCooldown = 60*3 //seconds 
	currentTriggersCooldown = 0 //seconds 
	triggersCooldownRegen = 1
	
	//combat
	collisionDamage = 10
	
	//kinetics
	acc = .5
	deflectPower = 100
	deflectResist = 0
	
	//EXP variables
	level = 1
	EXP = 0
	
	var EXPBaseCap = 4
	var EXPBaseExponential = 1.15
	var maxLevel = 50
	
	for (var i = 0; i < maxLevel-1; i++) {
		EXPCapList[i] = round(EXPBaseCap * power(EXPBaseExponential,i))
	}
	
	//other
	team = TEAM.ALLY
}

//OVERRIDE
initPlayerStats()


