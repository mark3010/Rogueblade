/// @description Insert description here
// You can write your code in this editor


//vel = other.vel

//vel[X] = -vel[X]
//vel[Y] = -vel[Y]


reflectionVector = -point_direction(x,y,other.x,other.y)
var reflectStrength = 6
var velDump = 0.5

vel[X] *= velDump
vel[Y] *= velDump
other.vel[X] *= velDump
other.vel[Y] *= velDump

vel[X] += lengthdir_x(reflectStrength,reflectionVector)
vel[Y] += lengthdir_y(reflectStrength,reflectionVector)
other.vel[X] -= lengthdir_x(reflectStrength,reflectionVector)
other.vel[Y] -= lengthdir_y(reflectStrength,reflectionVector)

cooldown += 1
