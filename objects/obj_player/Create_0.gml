/// @description Insert description here
// You can write your code in this editor

event_inherited()

//BASE PLAYER STATS
	//override
	stats.maxLife = 5
	stats.lifeRegen = 0.3 //per second
	stats.maxTriggers = 3
	stats.maxTriggersCooldown = 60*3 //seconds 
	stats.triggersCooldownRegen = 1
	//combat
	stats.collisionDamage = 10
	//kinetics
	stats.acc = .5
	stats.deflectPower = 100
	stats.deflectResist = 0

refreshCurrents()

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
