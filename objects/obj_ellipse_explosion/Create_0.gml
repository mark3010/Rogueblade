/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 60
image_xscale = 1
image_yscale = 1

color = c_white
bladeCol = c_orange
animation = 0
alpha = 1
scale = 1
velAdd = 0

function draw_me(a,b,c) {
	//surface_set_target(a)
	//var xOrigin = x
	//var yOrigin = y - zPosition
	//var shape = [[55*(1-animation),0],[0,55*(1-animation)],[-55*(1-animation),0],[0,-55*(1-animation)]]
	//var col = c_white
	//var width = 2

	//var col = merge_color(c_yellow,bladeCol,image_xscale/1.5)
	gpu_set_blendmode(bm_eq_add)
	///scr_draw_shape(xOrigin,yOrigin,shape,color,width)
	draw_set_alpha(alpha)
	draw_set_color(color)
	//draw_line_
	
	draw_sprite_ext(sprite_index,0,x,y-zPosition,animation*scale*image_xscale,animation*scale*image_yscale,image_angle,color,(alpha))
	//draw_sprite_ext(sprite_index,0,x,y-zPosition,animation,animation,image_angle,color,(alpha))
	//draw_text(x,y-zPosition-20,"-1 DQ save")
	
	//draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,0,color,1)
	draw_sprite_ext(spr_light,0,x,y-zPosition,(1-animation)*scale,(1-animation)*scale,direction,bladeCol,.6*(alpha))
	
	gpu_set_blendmode(bm_normal)
	//draw_sprite_ext(spr_death,0,x,y-zPosition,image_xscale,image_yscale*2,0,c_white,1)
	//draw_set_alpha( .3+(image_xscale/1.5))
	//draw_circle_color(x,y-zPosition,24/(.5+image_xscale),col,col,true)
	//draw_text(x,y-100,lifetime)
	//draw_text(x,y-90,color)
	draw_set_alpha(1)
	draw_set_color(c_white)
}