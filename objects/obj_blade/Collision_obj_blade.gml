/// @description Insert description here
// You can write your code in this editor
if !visible {exit}

var collision = scr_isBetweenIncluding(zPosition,other.zPosition,other.zPosition+other.dimensions.zLength)

if cooldownInstanceExists(other.instanceId) == undefined && collision {
	//sound
	if (currentTriggers + other.currentTriggers) > 0 {
		audio_play_sound(snd_collision_trigger, 10, false)
	} else {
		audio_play_sound(snd_collision_health, 10, false)
	}
	
	//resolved charged dashes
	if isDashing {executeDash()}
	if other.isDashing{other.executeDash()}
	
	if dashKineticModifierDuration > 0 {other.dashKineticModifierDuration = other.dashKineticModifierDurationMax}
	if other.dashKineticModifierDuration > 0 {dashKineticModifierDuration = dashKineticModifierDurationMax}
	
	//collision calculation
	reflectionVector = -point_direction(x,y,other.x,other.y)
	var collisionTimer = 5
	var reflectStrength = 4
	var velocityTransferDump = 0.9
	var heightDifferentiation = - sign(zPosition - other.zPosition)
	//store vectors for calculation
	var myVelocity = []
	array_copy(myVelocity,0,vel,0,2)
	var otherVelocity = []
	array_copy(otherVelocity,0,other.vel,0,2)
	
	//me
	cooldownInstanceAdd(cooldownMap,other.instanceId,collisionTimer)
	//velocity dump
	vel[X] *= 1 - power(1,stats.deflectionResistance / 100)
	vel[Y] *= 1 - power(1,stats.deflectionResistance / 100)
	//transfor velocity
	vel[X] += otherVelocity[X] * velocityTransferDump
	vel[Y] += otherVelocity[Y] * velocityTransferDump
	//collision power
	vel[X] -= lengthdir_x(reflectStrength * (other.stats.deflectionPower / stats.deflectionPower) ,reflectionVector)
	vel[Y] += lengthdir_y(reflectStrength * (other.stats.deflectionPower / stats.deflectionPower) ,reflectionVector)
	
	vel[Z]-=(abs(vel[X])+abs(vel[Y])) * heightDifferentiation
	
	//vel[Z] += irandom(500) / 100 * (1 - power(0.5,stats.deflectionResistance / 100)) * other.stats.deflectionPower / 100
	
	//other
	cooldownInstanceAdd(other.cooldownMap,instanceId,collisionTimer)
	//velocity dump
	other.vel[X] *= 1 - power(1,other.stats.deflectionResistance / 100)
	other.vel[Y] *= 1 - power(1,other.stats.deflectionResistance / 100)
	//transfor velocity
	other.vel[X] += myVelocity[X] * velocityTransferDump
	other.vel[Y] += myVelocity[Y] * velocityTransferDump
	//collision power
	other.vel[X] += lengthdir_x(reflectStrength * (stats.deflectionPower / other.stats.deflectionPower), reflectionVector)
	other.vel[Y] -= lengthdir_y(reflectStrength * (stats.deflectionPower / other.stats.deflectionPower), reflectionVector)
	//other.vel[Z] += irandom(500) / 100 * (1 - power(0.5,other.stats.deflectionResistance / 100)) * stats.deflectionPower / 100
	
	other.vel[Z]-=-(abs(other.vel[X])+abs(other.vel[Y]))* heightDifferentiation
	
	//damage calculation
	var myVelTotal = (abs(myVelocity[X]) + abs(myVelocity[Y]))
	var otherVelTotal = (abs(otherVelocity[X]) + abs(otherVelocity[Y]))
	//my
	var myDamageTaken = 5 + 1 * otherVelTotal / 2
	takeDamage(myDamageTaken,-reflectionVector+180,team==other.team)
	//other
	var otherDamageTaken = 5 + 1 * myVelTotal / 2
	other.takeDamage(otherDamageTaken,-reflectionVector,team==other.team)
	
	//effects
	if team != other.team {
		//find middle intersection
		var dir = point_direction(x,y,other.x,other.y)
		var dist = point_distance(x,y,other.x,other.y)
		var midX = lengthdir_x(dist,dir) / 2
		var midY = lengthdir_y(dist,dir) / 2
		var heightCorrection = 20
		//takeDamage(1)
		//other.takeDamage(1)
		is_array(myVelTotal)
		var col = merge_color(c_yellow,c_red,image_xscale/1.5)
		
		var sparkAmount = clamp(floor((myVelTotal + otherVelTotal) / 7),0,5)
	
		repeat (2+sparkAmount) {
			var spark = instance_create_layer(x+midX,y+midY-heightCorrection,layer,obj_hitspark)
			spark.energyColor = col
		}
		
		//collision particles
		var collisionParticle = instance_create_layer(x+midX,y+midY-heightCorrection,layer,obj_collision_spark)
		collisionParticle.direction = -reflectionVector+90
		collisionParticle.energyColor = col
		collisionParticle.image_xscale = collisionParticle.image_xscale * (0.6 + 0.4 * (sparkAmount)/5)
		collisionParticle.image_yscale = collisionParticle.image_yscale * (0.6 + 0.4 * (sparkAmount)/5)
	
		var collisionParticle = instance_create_layer(x+midX,y+midY-heightCorrection,layer,obj_collision_spark)
		collisionParticle.direction = -reflectionVector-90
		collisionParticle.energyColor = col
		collisionParticle.image_xscale = collisionParticle.image_xscale * (0.6 + 0.4 * (sparkAmount)/5)
		collisionParticle.image_yscale = collisionParticle.image_yscale * (0.6 + 0.4 * (sparkAmount)/5)
		
		var collisionShard = instance_create_layer(x+midX,y+midY-heightCorrection,layer,obj_blade_shard)
		collisionShard.direction = irandom(360)
		
	}


}

