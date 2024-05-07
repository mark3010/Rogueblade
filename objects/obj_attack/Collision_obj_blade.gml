/// @description Insert description here
// You can write your code in this editor

if other.id != ownerId {
	
	reflectionVector = point_direction(x,y,other.x,other.y) +180
	//collision power
	other.vel[X] -= lengthdir_x(1, reflectionVector)
	other.vel[Y] -= lengthdir_y(1, reflectionVector)
	
	
	//find blade edge intersection
	var dir = point_direction(other.x,other.y,x,y)
	var pointX = lengthdir_x(sprite_width,dir) / 2
	var pointY = lengthdir_y(sprite_width,dir) / 2
	var heightCorrection = 20

	var impact = instance_create_layer(other.x+pointX,other.y+pointY-heightCorrection,layer,obj_hit_impact)
	impact.zPosition = zPosition
	impact.lightColor = lightColor
	impact.energyColor = energyColor
	
	repeat (1+irandom(1)) {
		var spark = instance_create_layer(other.x+pointX,other.y+pointY-heightCorrection,layer,obj_hitspark)
		spark.zPosition = zPosition
		spark.energyColor = energyColor
		spark.lightColor = lightColor
		spark.sprite_index = spr_spark_small
		spark.speed = 4 +irandom(5)
	}
	
	other.takeDamage(0.5,direction,false)
	
	deathFlag = true
}