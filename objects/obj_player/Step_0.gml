//run parent code




//MOVEMENT
move_up    = keyboard_check(global.key_up)
move_down  = keyboard_check(global.key_down)
move_left  = keyboard_check(global.key_left)
move_right = keyboard_check(global.key_right)

//dash_up_dir    = keyboard_check_pressed(global.key_dash_up)
//dash_down_dir  = keyboard_check_pressed(global.key_dash_down)
//dash_left_dir  = keyboard_check_pressed(global.key_dash_left)
//dash_right_dir = keyboard_check_pressed(global.key_dash_right)

dash_up    = keyboard_check_pressed(global.key_dash_up)
dash_down  = keyboard_check_pressed(global.key_dash_down)
dash_left  = keyboard_check_pressed(global.key_dash_left)
dash_right = keyboard_check_pressed(global.key_dash_right)

dash_up_release    = keyboard_check_released(global.key_dash_up)
dash_down_release  = keyboard_check_released(global.key_dash_down)
dash_left_release  = keyboard_check_released(global.key_dash_left)
dash_right_release = keyboard_check_released(global.key_dash_right)

var dirX, dirY, dir

dirX = 0
dirY = 0

//MOVE
if (move_right || move_left) {
	dirX = move_right-move_left
}
if (move_up || move_down) {
	dirY = move_down-move_up
}

dir = point_direction(0,0,dirX,dirY)

if (move_right || move_left) {
		velAdd[@ X] += lengthdir_x(stats.acc,dir) * (1.5 - isDashing)/1.5
		obj_cam.torque(lengthdir_x(stats.acc,dir))
}

if (move_up || move_down) {
		velAdd[@ Y] += lengthdir_y(stats.acc,dir) * (1.5 - isDashing)/1.5
}

//DASH
dashKineticModifierDuration-- 
if dashKineticModifierDuration < 0 {dashKineticModifierDuration = 0}

	//record direction
if (dash_right || dash_left || dash_up || dash_down) && !isDashing {
	isDashing = true
	
	dash_right_dir = 0
	dash_left_dir = 0
	dash_up_dir = 0
	dash_down_dir = 0
	
	if dash_right {			dash_right_dir = 1
	} else if dash_left {	dash_left_dir = 1
	} else if dash_up {		dash_up_dir = 1
	} else {				dash_down_dir = 1
	}
}

	//charge dash
if isDashing {
	dashPower += 4 * stats.dashChargeRate
	if dashPower > 100 {
		dashPower = 100
	}
}

	//release dash
if isDashing && (dash_right_release + dash_left_release + dash_up_release + dash_down_release) > 0 || isDashing && hitFlash==1 {
	executeDash()
}


//dir = point_direction(0,0,dirX,dirY)

/*
if (dash_right || dash_left) {
		if dashPower < 100 {dashPower++}
} else {
	//carry momentum
	if sign(vel[@ X]) != sign(lengthdir_x(15,dir)) {
		velAdd[@ X] = 0//-vel[@ X]
	}
	//add dash
	velAdd[@ X] += lengthdir_x(15*dashPower,dir)
}

if (dash_up || dash_down) {
	if dashPower < 100 {dashPower++}
} else {
		//carry momentum
		if sign(velAdd[@ Y]) != sign(lengthdir_x(15,dir)) {
			velAdd[@ Y] = 0//-vel[@ Y]
		}
		//add dash
		velAdd[@ Y] += lengthdir_y(15*dashPower,dir)
}*/

event_inherited()

//LEVEL UP
if EXP >= EXPCapList[level-1] {
	//obj_upgrade_handler.getUpgrade(self)
	
	//refresh player
	EXP -= EXPCapList[level-1]
	level++
	currentLife = stats.maxLife
	
	//effects
	var levelUpEffect = instance_create_layer(x,y,layer,obj_level_up)
	levelUpEffect.target = id
	
	audio_play_sound(snd_level_up, 2, false);
}

//ATTACKS
if currentTriggers != stats.maxTriggers {		//condition
	
	isAttacking = 1
	
	if attackCooldown >= 60 / stats.attacksPerSecond  {	//attack pattern
		attackCooldown = 0
		
		var target = scr_instance_nearest_other(obj_blade)
		
		if instance_exists(target) {
			//shoot animation
			
			var shootDir = point_direction(x,y,target.x,target.y)
			var shootPointX = x + lengthdir_x(22,shootDir)
			var shootPointY = y + lengthdir_y(22,shootDir)
			
			var shootAnim = instance_create_layer(shootPointX,shootPointY,layer,obj_shot_flare)
			shootAnim.lightColor = lightColor
			shootAnim.energyColor = energyColor
			shootAnim.zPosition = zPosition +10
			//bullet
			
			var bullet = instance_create_layer(x,y,layer,obj_bullet)
			bullet.ownerId = id
			bullet.zPosition = zPosition +10
			bullet.lightColor = lightColor
			bullet.energyColor = energyColor
			bullet.direction = point_direction(x,y,target.x,target.y) + irandom(100)/100 * 10 - 5
			bullet.image_angle = bullet.direction
			
			//recoil
			vel[X] += lengthdir_x(stats.recoil, shootDir+180)
			vel[Y] += lengthdir_y(stats.recoil, shootDir+180)
		}
		
	}
} else {
	isAttacking -= .025
	if isAttacking < 0 {isAttacking = 0}
}