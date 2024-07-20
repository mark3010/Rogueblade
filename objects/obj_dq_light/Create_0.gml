/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 999
image_angle = direction
color = c_white
colorVar = 0

function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	var size = (1-colorVar)*1
	draw_sprite_ext(spr_dq_light,0,x,y-zPosition,size,size,direction-90,merge_color(bladeCol,c_black,colorVar),1-colorVar)
	gpu_set_blendmode(bm_normal)
}