event_inherited()

//customize
deathTrigger = 40 // in frames
size = 60 //in pixels
color = #FFF899
energyColor = #FFF899

var dir = irandom(359)
repeat(5) {
	var spark = instance_create_layer(x,y,layer,obj_levelspark)
	spark.direction = dir
	spark.zPosition = zPosition
	spark.energyColor = energyColor
	dir += 360/5
}

var levelupLight = instance_create_layer(x,y,layer,obj_levelup_light)
levelupLight.target = target
levelupLight.zPosition = zPosition
levelupLight.energyColor = energyColor

function draw_me(a,b,c) {
	//var centerDist =  lifetime  / deathTrigger * size
	//var alpha = ( deathTrigger - lifetime ) / deathTrigger

	//var triangleTop =	[0 + target.x,				-1 * centerDist + target.y - lifetime * 2 - zPosition]
	//var triangleLeft =	[-1 * centerDist+target.x,	0 + target.y - lifetime * 2 - zPosition]
	//var triangleRight = [1 * centerDist+target.x,	0 + target.y - lifetime * 2 - zPosition]

	//draw_set_color(color)
	//draw_set_alpha(alpha)

	gpu_set_blendmode(bm_eq_add)
	//draw_triangle(triangleTop[X],triangleTop[Y],triangleLeft[X],triangleLeft[Y],triangleRight[X],triangleRight[Y],false)

	draw_set_color(c_white)
	draw_set_alpha(1)

	var radius = ( deathTrigger - lifetime ) / 1000 * size
	var alpha = ( deathTrigger - lifetime ) / deathTrigger / 1.5

	draw_sprite_ext(spr_light,0,x,y-zPosition,radius,radius,direction,energyColor,alpha)
	//draw_sprite_ext(spr_circle4,0,target.x,target.y,radius,radius,0,energyColor,alpha)
	//draw_circle(target.x,target.y,radius,false)
	gpu_set_blendmode(bm_normal)
}