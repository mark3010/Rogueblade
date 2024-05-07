if deathFlag {
	ds_map_destroy(cooldownMap) //cleanup
	if instance_exists(obj_killCounter) {obj_killCounter.countKill(id,groupId)} // count death
	if instance_exists(obj_cam) {obj_cam.screenshake(2,1,0.1)} // shake screen
	
	var deathPosX = x
	var deathPosY = y-zPosition
	
	//CREATE DEATH EFFECTS
	var popStrength = (130+irandom(100))/100
	var popRotation = (irandom(400))/100 - 2
	var deathExplosion = instance_create_layer(x,y-10,layer,obj_death_explosion)
	
	/*
	//anchor
	var anchorPart = instance_create_layer(x,y,layer,obj_blade_part)
	anchorPart.model = anchor
	anchorPart.animationTilt = animationTilt
	anchorPart.vel = vel
	//launch it up
	anchorPart.vel[Z] = 4
	anchorPart.zPosition = 1
	//
	anchorPart.rotationBaseSpeed = rotationBaseSpeed
	anchorPart.stats = stats */
	
	//DEBRIS
	//hull
	var hullPart = instance_create_layer(deathPosX,deathPosY,layer,obj_blade_part)
	hullPart.model = hull
	hullPart.animationTilt = animationTilt
    array_copy(hullPart.vel, 0, vel, 0, array_length(vel))

	hullPart.rotationBaseSpeed = rotationBaseSpeed
	hullPart.stats = stats
	
	//change vel
	//hullPart.vel[X] //*= 
	//hullPart.vel[Y] //*= 
	hullPart.vel[X] += irandom(50)/25 -1
	hullPart.vel[Y] += irandom(50)/25 -1
	hullPart.vel[Z] = 5*popStrength
	hullPart.zRotSpeed = popRotation
	//
	
	//core
	var corePart = instance_create_layer(deathPosX,deathPosY,layer,obj_blade_part)
	corePart.model = core
	corePart.animationTilt = animationTilt
	array_copy(corePart.vel, 0, vel, 0, array_length(vel))
	corePart.rotationBaseSpeed = rotationBaseSpeed
	corePart.stats = stats 
	corePart.isCore = true
	
	//change vel
	corePart.vel[X] *= .4
	corePart.vel[Y] *= .4
	corePart.vel[X] += irandom(100)/25 -2
	corePart.vel[Y] += irandom(100)/25 -2
	corePart.vel[Z] = (6+irandom(200)/200)*popStrength
	corePart.zRotSpeed = popRotation*1.3
	//
	
	instance_destroy()
}