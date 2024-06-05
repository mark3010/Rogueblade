event_inherited()

//customize
deathTrigger = 20 // in frames
size = 2
color = merge_color(c_white,c_aqua,0.2)

function draw_me(a,b,c) {
	var radius = ( deathTrigger - lifetime ) / 20 * size
	var alpha = ( deathTrigger - lifetime ) / deathTrigger / 2


	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_light,0,x,y,radius,radius,direction,energyColor,alpha)
	draw_sprite_ext(spr_circle4,0,target.x,target.y,radius,radius,0,energyColor,alpha)
	//draw_circle(target.x,target.y,radius,false)
	gpu_set_blendmode(bm_normal)
}