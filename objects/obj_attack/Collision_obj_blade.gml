/// @description Insert description here
// You can write your code in this editor

if other.id != ownerId {
	
	reflectionVector = -point_direction(x,y,other.x,other.y)
	//collision power
	other.vel[X] += lengthdir_x(2, reflectionVector)
	other.vel[Y] += lengthdir_y(2, reflectionVector)
	
	
	//find blade edge intersection
	var dir = point_direction(other.x,other.y,x,y)
	var pointX = lengthdir_x(sprite_width,dir) / 2
	var pointY = lengthdir_y(sprite_width,dir) / 2
	var heightCorrection = 20

	instance_create_depth(other.x+pointX,other.y+pointY-heightCorrection,depth,obj_hit_impact)
	
	repeat (2+irandom(2)) {
		instance_create_depth(other.x+pointX,other.y+pointY-heightCorrection,depth,obj_hitspark)
	}
	other.takeDamage(0.5,false)
	
	var damageNumber = instance_create_depth(other.x,other.y-heightCorrection-16,depth,obj_damage_number)
	damageNumber.damage = 10
	
	deathFlag = true
}