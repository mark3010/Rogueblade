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
bladeCol = c_orange
function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	draw_set_color(merge_color(c_orange,c_black,colorVar))
	draw_sprite_ext(spr_light,0,x,y-zPosition,image_xscale*.3,image_yscale*.3,image_angle,merge_color(bladeCol,c_black,colorVar),.2)
	draw_text(x,y-zPosition+16,"-1 DQ save")
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale*(1-colorVar),image_yscale,image_angle,merge_color(color,c_black,colorVar),1)
	
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)
}
