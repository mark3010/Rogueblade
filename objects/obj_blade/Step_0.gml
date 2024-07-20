if !visible {exit}
// PRECALC
cooldownsCalculate()
lifeCalculate()
DQSaveCalculate()
triggersCalculate()
animationsCalculate()
scr_bladeArenaSync()
// variables provided:
	// inits objArena sync
	// inits "arenaBaseX", "arenaFlatBorderX", "arenaSlopedBorderX" vars. Same for Y
	// inits onSlope, onBorder vars

//FORCES APPLIED
	//ANIMATION SLANT
	//these functions create number between 0 and 1 based on how close the blade is to the border of the arena
	//power makes the linear function exponential instead
	
	//var slopeAngleStrength = 0.5 // 0 is flat arena border, 1 is vertical arena border, 0.5 is 45 degree arena border
	
	slantH = power(( arenaSlopedBorderX - arenaFlatBorderX ) / ( objArena.baseWidth - objArena.flatWidth ), 2)// * slopeAngleStrength
	slantV = power(( arenaSlopedBorderY - arenaFlatBorderY ) / ( objArena.baseRadius - objArena.flatRadius ), 2)// * slopeAngleStrength
		
	var dist = point_distance(arenaFlatBorderX,arenaFlatBorderY,arenaSlopedBorderX,arenaSlopedBorderY)
	var dir = point_direction(arenaFlatBorderX,arenaFlatBorderY,arenaSlopedBorderX,arenaSlopedBorderY)
	
var gravityVec = - (stats.zGravity / 60)

//gravity
vel[Z] += gravityVec

//bounce on floor
if zPosition <= 0 {
	//check if out of bounds
	if !(outOfBounds) && !(knockedOut) {
		zPosition = 0
	
		if vel[Z] < -3 {
			var landingAnim = instance_create_layer(x,y,layer,obj_ground_land)
			landingAnim.strength = abs(vel[Z])
			landingAnim.zPosition = 0
			landingAnim.image_alpha = clamp(landingAnim.strength,0,10)/10
			vel[Z] = -vel[Z] * stats.zBounciness / 100

			//apply underlying force
			vel[@ X] -= sign(lengthdir_x(dist,dir)) * slantH * 3
			vel[@ Y] -= sign(lengthdir_y(dist,dir)) * slantV * 3
		} else {
			vel[Z] = 0
		}
	} else {
		knockedOut = true
		
		if zPosition <= -300 {
			
			var dqExplosion = instance_create_layer(x,y,layer,obj_dq)
			dqExplosion.zPosition = zPosition
			if core.energyColor != c_white {dqExplosion.bladeCol = core.energyColor}
			dqExplosion.direction = point_direction(x,y,x-vel[X],y+vel[Z])
			
			if currentDQSaves > 0 {
				respawn()
				currentDQSaves--
				var dqAngel = instance_create_layer(x,y,layer,obj_dq_angel)
				show_debug_message("zPosition: "+string(zPosition))
				dqAngel.zPosition = zPosition - 36
				dqAngel.x = spawnPoint[X]
				dqAngel.y = spawnPoint[Y]
				if core.energyColor != c_white {dqAngel.bladeCol = core.energyColor}
			} else {
				die()
			}
		}
	}
} 

if zPosition == 0 {
	onGround = true
} else {
	onGround = false
}
//x and y axis
if onSlope {
	vel[@ X] -= sign(lengthdir_x(dist,dir)) * slantH * onGround
	vel[@ Y] -= sign(lengthdir_y(dist,dir)) * slantV * onGround
}

//add velAdd to velocity and wipe
vel[@ X] += velAdd[@ X]
vel[@ Y] += velAdd[@ Y]
vel[@ Z] += velAdd[@ Z]

velAdd = [0,0,0]

//DASH
dashKineticModifierDuration-- 
if dashKineticModifierDuration < 0 {dashKineticModifierDuration = 0}

//CORRECT POSITION TO INSIDE ARENA
/*
if (x > arenaSlopedBorderX || x < arenaSlopedBorderX) {
	x = arenaSlopedBorderX
}

if (y > arenaSlopedBorderY || y < arenaSlopedBorderY) {
	y = arenaSlopedBorderY
}*/

//DRAG
//drag only applies to the speed of the blade above the velMax threshold
if velVector > stats.velMax {
	surplusVector = velVector / stats.velMax
	
	velXSurplus = vel[X] * (surplusVector - 1)
	velYSurplus = vel[Y] * (surplusVector - 1)
	
	vel[X] -= velXSurplus * dragStrength * (1 - ceil(dashKineticModifierDuration/dashKineticModifierDurationMax) + dashKineticModifier)
	vel[Y] -= velYSurplus * dragStrength * (1 - ceil(dashKineticModifierDuration/dashKineticModifierDurationMax) + dashKineticModifier)
}

//CALCULATE BLADE KINETIC ATTRIBUTES
velVector = point_distance(0,0,vel[X],vel[Y])
dragVector = point_distance(0,0,-velXSurplus*dragStrength,-velYSurplus*dragStrength)

//ANIMATION VARIABLES
hitFlash = lerp(hitFlash,0,.2)
lifetime ++
spawnAnim = lerp(spawnAnim,0,.2)
hitDistortion = lerp(hitDistortion,0,.2)


if hitDistortion < .05 && hitDistortion > -.05 {
	hitDistortionDirection=0
}
if spinDownDuration > 0 {
	spinDownDuration--
}