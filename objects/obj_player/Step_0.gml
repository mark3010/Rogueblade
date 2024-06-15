if !visible {exit}
if !global.inputHighjack {
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
}

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

event_inherited()

//LEVEL UP
if EXP >= EXPCapList[level-1] {
	levelUp()
}

//ATTACKS
var atkPattern = core.partEnum
switch (atkPattern) {
	case BLADE_CORE.BLUE:
		if shieldDamageTakenMemory > shieldDamageTakenMemoryPrevious {
			isAttacking = 1	
		}
		
		if attackCooldown >= 60 / stats.attacksPerSecond && isAttacking > 0 {
			attackCooldown = 0
			var target = scr_instance_nearest_other(obj_blade)
		
			if instance_exists(target) {
				var atkDir = point_direction(x,y,target.x,target.y)
				attack(atkDir)
			}
		}
		
		isAttacking -= 1 / (60 * 2.5) //2.5 is seconds of duration
		if isAttacking < 0 {isAttacking = 0}
	break;
		case BLADE_CORE.RED:
		if shieldDamageTakenMemory > shieldDamageTakenMemoryPrevious {
			isAttacking = 1	
			
			var atkQueue = shieldDamageTakenMemory - shieldDamageTakenMemoryPrevious
			
			repeat (atkQueue){
				attack(hitDistortionDirection)
			}
		}
		
		isAttacking -= .1 //2.5 is seconds of duration
		if isAttacking < 0 {isAttacking = 0}
	break;
	case BLADE_CORE.ORANGE: 
		if currentTriggers != stats.maxTriggers {		//condition
			isAttacking = ramp
			
			var rampSpeed = 1/60 / 5 //ramps over 5 seconds
			var target = scr_instance_nearest_other(obj_blade)
			
			if attackCooldown >= 60 / (stats.attacksPerSecond * (0.5 + ramp * 1)) {	//attack pattern
				attackCooldown = 0
		
				if instance_exists(target) {
					var atkDir = point_direction(x,y,target.x,target.y)
					attack(atkDir)
				} 
			}
			
			if instance_exists(target) {
				if ramp < 1 && ramp >= 0 {ramp += rampSpeed}
			} else {
				ramp -= rampSpeed/2
				if ramp < 0 {ramp = 0}
			}
		} else {
			attackCooldown = 0
			ramp = 0
			isAttacking -= .1
			if isAttacking < 0 {isAttacking = 0}
		}
	break;
	case BLADE_CORE.GREEN:
		if shieldDamageTakenMemory > shieldDamageTakenMemoryPrevious {
			isAttacking = 1	
			
			var atkQueue = shieldDamageTakenMemory - shieldDamageTakenMemoryPrevious
			
			repeat (atkQueue){
				var target = scr_instance_nearest_other(obj_blade)
				var angleDiff = 180 / (stats.attacksPerSecond)
				if instance_exists(target) {
					
					var queue1 = []
					var queue2 = []
					
					for (var i = 0; i < stats.attacksPerSecond; i++) {					
						var atkDir1 = hitDistortionDirection + 90 + angleDiff*i
						array_push(queue1,{attackDirection : atkDir1})
						var atkDir2 = hitDistortionDirection - 90 + angleDiff*i
						array_push(queue2,{attackDirection : atkDir2})
					}
					
					var atkPattern = instance_create_layer(x,y,layer,obj_attack_pattern)
					atkPattern.setTarget(obj_player)
					atkPattern.setQueue(queue1)
					atkPattern.setAngle(10)
					var atkPattern = instance_create_layer(x,y,layer,obj_attack_pattern)
					atkPattern.setTarget(obj_player)
					atkPattern.setQueue(queue2)
					atkPattern.setAngle(10)
				}
			}
		}
		
		
		isAttacking -= .1 //2.5 is seconds of duration
		if isAttacking < 0 {isAttacking = 0}
	break;
	default:
	break;
}

lifeDamageTakenMemoryPrevious = lifeDamageTakenMemory
shieldDamageTakenMemoryPrevious = shieldDamageTakenMemory

if isAttacking > 0 {attackCooldown++}