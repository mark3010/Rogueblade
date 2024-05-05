//run parent code




//MOVEMENT
move_up    = keyboard_check(global.key_up)
move_down  = keyboard_check(global.key_down)
move_left  = keyboard_check(global.key_left)
move_right = keyboard_check(global.key_right)

dash_up_dir    = keyboard_check_released(global.key_dash_up)
dash_down_dir  = keyboard_check_released(global.key_dash_down)
dash_left_dir  = keyboard_check_released(global.key_dash_left)
dash_right_dir = keyboard_check_released(global.key_dash_right)

dash_up    = keyboard_check(global.key_dash_up)
dash_down  = keyboard_check(global.key_dash_down)
dash_left  = keyboard_check(global.key_dash_left)
dash_right = keyboard_check(global.key_dash_right)

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
		velAdd[@ X] += lengthdir_x(stats.acc,dir) * (1.2 - isDashing)/1.2
		obj_cam.torque(lengthdir_x(stats.acc,dir))
}

if (move_up || move_down) {
		velAdd[@ Y] += lengthdir_y(stats.acc,dir) * (1.2 - isDashing)/1.2
}

//DASH
if (dash_right || dash_left || dash_up || dash_down) {
	if dashPower < 100 {dashPower += 2}
	isDashing = true
}

if dashPower > 0 {
	
	//calculate direction
	dirX = dash_right_dir-dash_left_dir
	dirY = dash_down_dir-dash_up_dir
	dir = point_direction(0,0,dirX,dirY)
	
	if dash_right_dir || dash_left_dir {
		//carry momentum
		if sign(vel[@ X]) != sign(lengthdir_x(15,dir)) {
			velAdd[@ X] = 0//-vel[@ X]
		}
		//add dash
		velAdd[@ X] += lengthdir_x(10+15*dashPower/100,dir)
		dashPower = 0
		isDashing = false
		
	} else if dash_up_dir || dash_down_dir{
		//carry momentum
		if sign(velAdd[@ Y]) != sign(lengthdir_x(15,dir)) {
			velAdd[@ Y] = 0//-vel[@ Y]
		}
		//add dash
		velAdd[@ Y] += lengthdir_y(10+15*dashPower/100,dir)
		dashPower = 0
		isDashing = false
	}
}

if (dash_right || dash_left ) {
	//dirX = dash_right-dash_left
}

if (dash_up || dash_down) {
	//dirY = dash_down-dash_up
}

dir = point_direction(0,0,dirX,dirY)

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
	obj_upgrade_handler.getUpgrade(self)
	
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
			var shootPointY = y + lengthdir_y(22,shootDir) - 20
			
			var shootAnim = instance_create_layer(shootPointX,shootPointY,layer,obj_shot_flare)
			shootAnim.lightColor = lightColor
			//bullet
			
			var bullet = instance_create_layer(x,y-20,layer,obj_bullet)
			bullet.ownerId = id
			bullet.lightColor = lightColor
			bullet.direction = point_direction(x,y,target.x,target.y)
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