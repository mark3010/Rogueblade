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

//MOVEMENT
move_up    = 0
move_down  = 0
move_left  = 0
move_right = 0
dash_up    = 0
dash_down  = 0
dash_left  = 0
dash_right = 0
dash_up_release    = 0
dash_down_release  = 0
dash_left_release  = 0
dash_right_release = 0

//COMPONENTS
function loadPlayer() {
	var playerBuilder = instance_create_layer(x,y,layer,obj_player_builder)
	var playerSettings = playerBuilder.getPlayerSettings()

	core = playerSettings.core.core
	lightColor = playerSettings.core.lightColor
	energyColor = playerSettings.core.energyColor
	hull = playerSettings.hull
	anchor = playerSettings.anchor

	instance_destroy(playerBuilder)
}

loadPlayer()

function updatePlayerCore(coreEnum) {
	var playerBuilder = instance_create_layer(x,y,layer,obj_player_builder)
	core = playerBuilder.getCore(coreEnum).core
	lightColor = playerBuilder.getCore(coreEnum).lightColor
	energyColor = playerBuilder.getCore(coreEnum).energyColor
	instance_destroy(playerBuilder)
}

function updatePlayerHull(coreEnum) {
	var playerBuilder = instance_create_layer(x,y,layer,obj_player_builder)
	hull = playerBuilder.getHull(coreEnum)
	instance_destroy(playerBuilder)
}

function updatePlayerAnchor(coreEnum) {
	var playerBuilder = instance_create_layer(x,y,layer,obj_player_builder)
	anchor = playerBuilder.getAnchor(coreEnum)
	instance_destroy(playerBuilder)
}

//BASE PLAYER STATS
	//override
	stats.maxLife = 40
	stats.lifeRegen = 0.3 //per second
	stats.maxTriggers = 2
	stats.maxTriggersCooldown = 60*4 //seconds 
	stats.triggersCooldownRegen = 1
	//combat
	stats.collisionDamage = 10
	//kinetics
	stats.acc = .3
	//stats.deflectionPower = 150
	//stats.deflectionResistance = 150

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

function executeDash() {
		//calculate direction
	dirX = dash_right_dir-dash_left_dir
	dirY = dash_down_dir-dash_up_dir
	dir = point_direction(0,0,dirX,dirY)
	
	var dashSpeed = (5 + 12 * floor(dashPower/100) ) * dashPower/100
	
	//carry momentum
	if sign(vel[@ X]) != sign(lengthdir_x(15,dir)) {
		velAdd[@ X] = 0//-vel[@ X]
	}


	//carry momentum
	if sign(velAdd[@ Y]) != sign(lengthdir_x(15,dir)) {
		velAdd[@ Y] = 0//-vel[@ Y]
	}
	//add dash
	velAdd[@ X] += lengthdir_x(dashSpeed,dir)
	velAdd[@ Y] += lengthdir_y(dashSpeed,dir)
	velAdd[@ Z] -= 7*dashPower/100
	hitDistortion = -1*dashPower/100
	hitDistortionDirection = dir
	dashKineticModifierDuration = dashKineticModifierDurationMax
	
	//reset
	dashPower = 0
	isDashing = false
	
	//animation
	var groundPunt = instance_create_layer(x,y,layer,obj_ground_punt)
	groundPunt.direction = dir+180
	groundPunt.image_angle = dir+180
}

//other
team = TEAM.ALLY
