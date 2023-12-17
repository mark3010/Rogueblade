/// @description Insert description here
// You can write your code in this editor
if cooldownInstanceExists(other.instanceId) == undefined {
	//sound
	if (currentTriggers + other.currentTriggers) > 0 {
		audio_play_sound(snd_collision_trigger, 10, false)
	} else {
		audio_play_sound(snd_collision_health, 10, false)
	}
	
	//damage calculation
	if team != other.team {
		takeDamage(1)
		other.takeDamage(1)
	}

	//collision calculation
	reflectionVector = -point_direction(x,y,other.x,other.y)
	var collisionTimer = 5
	var reflectStrength = 6
	var velDump = 0.5

	//me
	cooldownInstanceAdd(cooldownMap,other.instanceId,collisionTimer)
	vel[X] *= velDump
	vel[Y] *= velDump
	vel[X] -= lengthdir_x(reflectStrength,reflectionVector)
	vel[Y] += lengthdir_y(reflectStrength,reflectionVector)
	hitFlash = 1
	
	//other
	cooldownInstanceAdd(other.cooldownMap,instanceId,collisionTimer)
	other.vel[X] *= velDump
	other.vel[Y] *= velDump
	other.vel[X] += lengthdir_x(reflectStrength,reflectionVector)
	other.vel[Y] -= lengthdir_y(reflectStrength,reflectionVector)
	other.hitFlash = 1
	
	//sound
	
}

