/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 120
spd = 16
direction = 90
image_xscale = 1
image_yscale = 1
color = c_white
colorVar = 1
energyColor = c_orange
target = noone

function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	draw_set_color(merge_color(energyColor,c_black,colorVar))
	draw_set_alpha(1)
	draw_sprite_ext(spr_light,0,x,y-zPosition+8,image_xscale*.7,image_yscale*.4,image_angle,merge_color(energyColor,c_black,colorVar),.1)
	draw_set_font(font_silkscreen)
	draw_text(x,y-zPosition+16,"+1 skill points")
	draw_text(x,y-zPosition,"Level Up")
	//draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale*(1-colorVar),image_yscale,image_angle,merge_color(color,c_black,colorVar),1)
	
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)
}
