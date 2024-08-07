if !visible {exit}
if deathFlag {
	ds_map_destroy(cooldownMap) //cleanup
	if instance_exists(obj_arenaStatCounter) {obj_arenaStatCounter.countKill(id,groupId)} // count death
	//if instance_exists(obj_cam) {obj_cam.screenshake(2,1,0.1)} // shake screen
	if instance_exists(obj_cam) {obj_cam.screenshake(3,2,0.5)} // shake screen
	
	var deathPosX = x
	var deathPosY = y
	
	//CREATE DEATH EFFECTS
	
	var popStrength = (130+irandom(100))/100
	var popRotation = (irandom(400))/100 - 2
		
	if zPosition < -100 {
		
	} else {
		var deathExplosion = instance_create_layer(x,y,layer,obj_death_explosion)
		deathExplosion.zPosition = zPosition
	}

	
	/*
	repeat(5) {
		var bladeShardDirection = point_direction(x,y,x+vel[X],y+vel[Y]) + irandom(80) - 40
		var bladeShard = instance_create_layer(x,y,layer,obj_blade_shard)
		bladeShard.direction = bladeShardDirection
	}*/
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
	hullPart.zPosition = zPosition
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
	corePart.zPosition = zPosition
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