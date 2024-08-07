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

function healFull() {
	currentLife = stats.maxLife
	currentTriggers = stats.maxTriggers
	currentDQSaves = stats.DQSaveMax
}

#region //COMPONENTS LOADING
function loadPlayer() {
	var playerBuilder = instance_create_layer(x,y,layer,obj_player_builder)
	var playerSettings = playerBuilder.getPlayerSettings()
	stats.maxLife = 0
	core = playerSettings.core
	stats = scr_structs_combine(stats,core.stats,"add")

	lightColor = playerSettings.core.lightColor
	energyColor = playerSettings.core.energyColor
	
	hull = playerSettings.hull
	stats = scr_structs_combine(stats,hull.stats,"add")
	
	anchor = playerSettings.anchor
	stats = scr_structs_combine(stats,anchor.stats,"add")
	healFull()

	instance_destroy(playerBuilder)
}

loadPlayer()

function updatePlayerCore(coreEnum) {
	var playerBuilder = instance_create_layer(x,y,layer,obj_player_builder)
	//change part
	stats = scr_structs_combine(stats,core.stats,"subtract")
	core = playerBuilder.getCore(coreEnum)
	stats = scr_structs_combine(stats,core.stats,"add")
	healFull()
	lightColor = playerBuilder.getCore(coreEnum).lightColor
	energyColor = playerBuilder.getCore(coreEnum).energyColor
	spawnAnim = 1
	instance_destroy(playerBuilder)
}

function updatePlayerHull(coreEnum) {
	var playerBuilder = instance_create_layer(x,y,layer,obj_player_builder)
	//change part
	stats = scr_structs_combine(stats,hull.stats,"subtract")
	hull = playerBuilder.getHull(coreEnum)
	stats = scr_structs_combine(stats,hull.stats,"add")
	healFull()
	spawnAnim = 1
	instance_destroy(playerBuilder)
}

function updatePlayerAnchor(coreEnum) {
	var playerBuilder = instance_create_layer(x,y,layer,obj_player_builder)
	//change part
	stats = scr_structs_combine(stats,anchor.stats,"subtract")
	anchor = playerBuilder.getAnchor(coreEnum)
	stats = scr_structs_combine(stats,anchor.stats,"add")
	healFull()
	spawnAnim = 1
	instance_destroy(playerBuilder)
}

function updateStats(_stats,_mode) {
	stats = scr_structs_combine(stats,_stats,_mode)
}

#endregion

refreshCurrents()

#region //EXP variables
level = 1
EXP = 0
	
var EXPBaseCap = 4
var EXPBaseExponential = 1.15
var maxLevel = 50
	
for (var i = 0; i < maxLevel-1; i++) {
	EXPCapList[i] = round(EXPBaseCap * power(EXPBaseExponential,i))
}
#endregion

#region // DASH
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
	velAdd[@ Z] += 4*dashPower/100
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
	
	var groundPunt = instance_create_layer(x,y,layer,obj_dash_lines)
	groundPunt.direction = dir
	groundPunt.image_angle = dir
}
#endregion

ramp = 0

function attack(_direction,_angle=0) {
	//shoot animation
			
	var shootDir = _direction
	var shootPointX = x + lengthdir_x(22,shootDir)
	var shootPointY = y + lengthdir_y(22,shootDir)
			
	var shootAnim = instance_create_layer(shootPointX,shootPointY,layer,obj_shot_flare)
	shootAnim.lightColor = lightColor
	shootAnim.energyColor = energyColor
	shootAnim.zPosition = zPosition +10
	//bullet
	
	repeat (stats.maxProjectiles) {
		
		var bulletDir = shootDir +  irandom(stats.projectileSpread) - stats.projectileSpread/2
		
		var bullet = instance_create_layer(x,y,layer,obj_bullet)
		bullet.ownerId = id
		bullet.zPosition = zPosition +10
		bullet.lightColor = lightColor
		bullet.energyColor = energyColor
		bullet.direction =	bulletDir + _angle
		bullet.image_angle = bullet.direction
	}
	//recoil
	vel[X] += lengthdir_x(stats.recoil, shootDir+180)
	vel[Y] += lengthdir_y(stats.recoil, shootDir+180)
}

function levelUp() {
	//refresh player
	EXP -= EXPCapList[level-1]
	level++
	obj_skilltree_upgrade_tracker.skillPoints++
	currentLife = stats.maxLife
	
	//kinetics
	enemies = ds_list_create();
	
	with(obj_blade) {
		if id != other.id {
		    if(distance_to_point(other.x, other.y) <= 120) {
				ds_list_add(other.enemies, id);
			}
		}
	}

	//show_debug_message(string(ds_list_size(enemies)) + " THIS IS ENEMY LIST SIZE")
	if(!ds_list_empty(enemies)) {
	    for(var i=0; i<ds_list_size(enemies); i++) {
			var enemy = ds_list_find_value(enemies, i);
			//show_debug_message(string(enemy) + " THIS IS ENEMY")
			var directionPointing = point_direction(x,y,enemy.x,enemy.y)
			var directionLength = point_distance(x,y,enemy.x,enemy.y)
			enemy.vel[X] += lengthdir_x(directionLength/10,directionPointing)
			enemy.vel[Y] += lengthdir_y(directionLength/10,directionPointing)
	    }
	}

	//now get rid of the list
	ds_list_destroy(enemies);
	
	//visual and audio effects
	var levelUpEffect = instance_create_layer(x,y,layer,obj_level_up)
	levelUpEffect.target = id
	spawnAnim = 1
	audio_play_sound(snd_level_up, 2, false);
	
	
}

//other
team = TEAM.ALLY
