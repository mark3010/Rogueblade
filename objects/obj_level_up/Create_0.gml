event_inherited()

//customize
deathTrigger = 40 // in frames
size = 80 //in pixels
color = #FFF899
energyColor = #FFF899

function draw_me(a,b,c) {
	var centerDist =  lifetime  / deathTrigger * size
	var alpha = ( deathTrigger - lifetime ) / deathTrigger

	var triangleTop =	[0 + target.x,				-1 * centerDist + target.y - lifetime * 2 - zPosition]
	var triangleLeft =	[-1 * centerDist+target.x,	0 + target.y - lifetime * 2 - zPosition]
	var triangleRight = [1 * centerDist+target.x,	0 + target.y - lifetime * 2 - zPosition]

	draw_set_color(color)
	draw_set_alpha(alpha)

	gpu_set_blendmode(bm_eq_add)
	draw_triangle(triangleTop[X],triangleTop[Y],triangleLeft[X],triangleLeft[Y],triangleRight[X],triangleRight[Y],false)

	draw_set_color(c_white)
	draw_set_alpha(1)

	var radius = ( deathTrigger - lifetime ) / 1000 * size
	var alpha = ( deathTrigger - lifetime ) / deathTrigger / 2

	draw_sprite_ext(spr_light,0,x,y-zPosition,radius,radius,direction,energyColor,alpha)
	//draw_sprite_ext(spr_circle4,0,target.x,target.y,radius,radius,0,energyColor,alpha)
	//draw_circle(target.x,target.y,radius,false)
	gpu_set_blendmode(bm_normal)
}