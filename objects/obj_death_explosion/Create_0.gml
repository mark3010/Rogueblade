/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 10
image_angle = direction
image_xscale = 1.5
image_yscale = 1.5

function draw_me() {
	var col = merge_color(c_yellow,c_red,image_xscale/1.5)
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_light,0,x,y-zPosition,image_xscale*.7,image_yscale*.7,direction,col,1*image_xscale/1.5)
	gpu_set_blendmode(bm_normal)
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,0,c_white,1)
	draw_sprite_ext(spr_death,0,x,y-zPosition,image_xscale,image_yscale*2,0,c_white,1)
	draw_set_alpha( .3+(image_xscale/1.5))
	draw_circle_color(x,y-zPosition,24/(.5+image_xscale),col,col,true)
	draw_set_alpha(1)
}