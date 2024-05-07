// PRECALC
cooldownsCalculate()
lifeCalculate()
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
	
//z axis
/*
if zPosition <= 0 && vel[Z] < -1 {	//bounce on ground
	vel[Z] = -vel[Z] * stats.zBounciness / 100
	
	//apply underlying force
	vel[@ X] -= sign(lengthdir_x(dist,dir)) * slantH * 3
	vel[@ Y] -= sign(lengthdir_y(dist,dir)) * slantV * 3
}

if zPosition <= 0 && vel[Z] > -1 && vel[Z] <= 0 {	//cut bounce
	vel[Z] = 0
	zPosition = 0
}

if zPosition > 0 {					//apply gravity
	vel[Z] -= (stats.zGravity / 60)
}
*/
var gravityVec = - (stats.zGravity / 60)

//gravity
vel[Z] += gravityVec

//bounce on floor
if zPosition <= 0 {
	zPosition = 0
	
	if vel[Z] < -3 {
		vel[Z] = -vel[Z] * stats.zBounciness / 100
	
		//apply underlying force
		vel[@ X] -= sign(lengthdir_x(dist,dir)) * slantH * 3
		vel[@ Y] -= sign(lengthdir_y(dist,dir)) * slantV * 3
	} else {
		vel[Z] = 0
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

//CORRECT POSITION TO INSIDE ARENA
if (x > arenaSlopedBorderX || x < arenaSlopedBorderX) {
	x = arenaSlopedBorderX
}

if (y > arenaSlopedBorderY || y < arenaSlopedBorderY) {
	y = arenaSlopedBorderY
}

//DRAG
//drag only applies to the speed of the blade above the velMax threshold
if velVector > stats.velMax {
	surplusVector = velVector / stats.velMax
	
	velXSurplus = vel[X] * (surplusVector - 1)
	velYSurplus = vel[Y] * (surplusVector - 1)
	
	vel[X] -= velXSurplus * dragStrength * (1 - ceil(dashKineticModifierDuration/dashKineticModifierDurationMax) + dashKineticModifier)
	vel[Y] -= velYSurplus * dragStrength * (1 - ceil(dashKineticModifierDuration/dashKineticModifierDurationMax) + dashKineticModifier)
}

//ATTACK
attackCooldown++

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