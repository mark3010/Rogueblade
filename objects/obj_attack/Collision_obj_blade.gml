/// @description Insert description here
// You can write your code in this editor

if other.id != ownerId {
	
	//find blade edge intersection
	var dir = point_direction(other.x,other.y,x,y)
	var pointX = lengthdir_x(sprite_width,dir) / 2
	var pointY = lengthdir_y(sprite_width,dir) / 2
	var heightCorrection = 20

		
	repeat (2+irandom(2)) {
		instance_create_depth(other.x+pointX,other.y+pointY-heightCorrection,depth,obj_hitspark)
	}
	other.takeDamage(0.025,false)
	
	deathFlag = true
}