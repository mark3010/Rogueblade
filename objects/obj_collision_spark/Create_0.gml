/// @description Insert description here
// You can write your code in this editor
event_inherited()
lifetime = 0
deathTrigger = 6
//speed = 1
direction = irandom(359)
image_angle = direction
image_xscale = 1
image_yscale = 1
zPosition = 24
function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_light,0,x,y-zPosition,image_xscale*1.5,image_yscale*1.5,direction,merge_color(energyColor,c_grey,0),image_alpha*.2)
	gpu_set_blendmode(bm_normal)
	//draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,direction,c_white,image_alpha)
}