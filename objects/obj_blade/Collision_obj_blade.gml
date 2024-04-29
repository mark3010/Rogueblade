/// @description Insert description here
// You can write your code in this editor
var collision = scr_isBetweenIncluding(zPosition,other.zPosition,other.zPosition+other.dimensions.zLength)

if cooldownInstanceExists(other.instanceId) == undefined && collision {
	//sound
	if (currentTriggers + other.currentTriggers) > 0 {
		audio_play_sound(snd_collision_trigger, 10, false)
	} else {
		audio_play_sound(snd_collision_health, 10, false)
	}
	
	//collision calculation
	reflectionVector = -point_direction(x,y,other.x,other.y)
	var collisionTimer = 5
	var reflectStrength = 6

	//me
	cooldownInstanceAdd(cooldownMap,other.instanceId,collisionTimer)
	//velocity dump
	vel[X] *= 1 - power(0.5,stats.deflectionResistance / 100)
	vel[Y] *= 1 - power(0.5,stats.deflectionResistance / 100)
	//collision power
	vel[X] -= lengthdir_x(reflectStrength * (other.stats.deflectionPower / stats.deflectionPower) ,reflectionVector)
	vel[Y] += lengthdir_y(reflectStrength * (other.stats.deflectionPower / stats.deflectionPower) ,reflectionVector)
	//vel[Z] += irandom(500) / 100 * (1 - power(0.5,stats.deflectionResistance / 100)) * other.stats.deflectionPower / 100
	
	//other
	cooldownInstanceAdd(other.cooldownMap,instanceId,collisionTimer)
	//velocity dump
	other.vel[X] *= 1 - power(0.5,other.stats.deflectionResistance / 100)
	other.vel[Y] *= 1 - power(0.5,other.stats.deflectionResistance / 100)
	//collision power
	other.vel[X] += lengthdir_x(reflectStrength * (stats.deflectionPower / other.stats.deflectionPower), reflectionVector)
	other.vel[Y] -= lengthdir_y(reflectStrength * (stats.deflectionPower / other.stats.deflectionPower), reflectionVector)
	//other.vel[Z] += irandom(500) / 100 * (1 - power(0.5,other.stats.deflectionResistance / 100)) * stats.deflectionPower / 100
	
	//damage calculation
	takeDamage(1,team==other.team)
	other.takeDamage(1,team==other.team)
	
	if team != other.team {
		//find middle intersection
		var dir = point_direction(x,y,other.x,other.y)
		var dist = point_distance(x,y,other.x,other.y)
		var midX = lengthdir_x(dist,dir) / 2
		var midY = lengthdir_y(dist,dir) / 2
		var heightCorrection = 20
		//takeDamage(1)
		//other.takeDamage(1)
		
		repeat (2+irandom(2)) {
			instance_create_layer(x+midX,y+midY-heightCorrection,layer,obj_hitspark)
		}
	}
	

}

