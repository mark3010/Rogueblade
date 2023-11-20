// PRECALC
scr_bladeArenaSync()

cooldownsCalculate()
// variables provided:
	// inits objArena
	// inits "arenaBaseX", "arenaFlatBorderX", "arenaSlopedBorderX" vars. Same for Y
	// inits onSlope, onBorder vars

//FORCES APPLIED
if onSlope {
	//ANIMATION SLANT
	//these functions create number between 0 and 1 based on how close the blade is to the border of the arena
	//power makes the linear function exponential instead
	
	//var slopeAngleStrength = 0.5 // 0 is flat arena border, 1 is vertical arena border, 0.5 is 45 degree arena border
	
	slantH = power(( arenaSlopedBorderX - arenaFlatBorderX ) / ( objArena.baseWidth - objArena.flatWidth ), 2)// * slopeAngleStrength
	slantV = power(( arenaSlopedBorderY - arenaFlatBorderY ) / ( objArena.baseRadius - objArena.flatRadius ), 2)// * slopeAngleStrength
		
	var dist = point_distance(arenaFlatBorderX,arenaFlatBorderY,arenaSlopedBorderX,arenaSlopedBorderY)
	var dir = point_direction(arenaFlatBorderX,arenaFlatBorderY,arenaSlopedBorderX,arenaSlopedBorderY)
	
	vel[@ X] -= lengthdir_x(dist,dir)/150 * slantH
	vel[@ Y] -= lengthdir_y(dist,dir)/150 * slantV
}

//CORRECT POSITION TO INSIDE ARENA
if (x > arenaSlopedBorderX || x < arenaSlopedBorderX) {
	x = arenaSlopedBorderX
}

if (y > arenaSlopedBorderY || y < arenaSlopedBorderY) {
	y = arenaSlopedBorderY
}

//DRAG
//drag only applies to the speed of the blade above the velMax threshold
if velVector > velMax {
	surplusVector = velVector / velMax
	
	velXSurplus = vel[X] * (surplusVector - 1)
	velYSurplus = vel[Y] * (surplusVector - 1)
	
	vel[X] -= velXSurplus*dragStrength
	vel[Y] -= velYSurplus*dragStrength
}

//CALCULATE BLADE KINETIC ATTRIBUTES
velVector = point_distance(0,0,vel[X],vel[Y])
dragVector = point_distance(0,0,-velXSurplus*dragStrength,-velYSurplus*dragStrength)
