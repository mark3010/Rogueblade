/// @description Insert description here
// You can write your code in this editor

event_inherited()

//CONTROLS
//keybindings
global.key_up = ord("W")
global.key_down = ord("S")
global.key_right = ord("D")
global.key_left = ord("A")

global.key_dash_up = vk_up
global.key_dash_down = vk_down
global.key_dash_right = vk_right
global.key_dash_left = vk_left

//COMPONENTS
anchor =	new Model(spr_anchor1_pattern,spr_anchor1_material)
hull =		new Model(spr_hull1_pattern,spr_hull1_material)
core =		new Model(spr_core1_pattern,spr_core1_material)

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