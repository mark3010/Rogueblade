/// @description Insert description here
// You can write your code in this editor
if cooldownInstanceExists(other.instanceId) == undefined {
	//damage calculation
	currentLife--
	other.currentLife--

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
}

