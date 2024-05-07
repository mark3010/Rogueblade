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
var randomCore = irandom(6)
if randomCore == 0 {
	core =		new Model(spr_core1_pattern,spr_core1_material)
	lightColor = merge_color(c_white,c_aqua,.4)
	energyColor = merge_color(c_white,c_aqua,.8)
} else if randomCore == 1 {
	core =		new Model(spr_core1_pattern,spr_core1_material3)
	lightColor = merge_color(c_white,c_green,.4)
	energyColor = merge_color(c_white,c_green,.8)
}else if randomCore == 2 {
	core =		new Model(spr_core1_pattern,spr_core1_material4)
	lightColor = merge_color(c_white,c_red,.4)
	energyColor = merge_color(c_white,c_red,.8)
}else if randomCore == 3 {
	core =		new Model(spr_core2_pattern,spr_core2_material)
	lightColor = merge_color(c_white,c_yellow,.2)
	energyColor = merge_color(c_white,c_yellow,.5)
}else if randomCore == 4 {
	core =		new Model(spr_core3_pattern,spr_core1_material5)
	lightColor = merge_color(c_white,c_black,0)
	energyColor = merge_color(c_white,c_black,0)
} else {
	core =		new Model(spr_core1_pattern,spr_core1_material5)
	lightColor = merge_color(c_white,c_orange,.4)
	energyColor = merge_color(c_white,c_orange,.8)
}

anchor =	new Model(spr_anchor1_pattern,spr_anchor1_material)

var randomHull = irandom(3)
if randomHull == 0 {
	hull =		new Model(spr_hull1_pattern,spr_hull1_material)
} else if randomHull == 1 {
	hull =		new Model(spr_hull2_pattern,spr_hull2_material)
} else if randomHull == 2 {
	hull =		new Model(spr_hull4_pattern,spr_hull4_material)
} else {
	hull =		new Model(spr_hull3_pattern,spr_hull3_material)
}

//core =		new Model(spr_core1_pattern,spr_core1_material)

//BASE PLAYER STATS
	//override
	stats.maxLife = 4
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
