/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 999
direction = 90
image_angle = direction
color = c_white
colorVar = 0
target = noone

function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	var size = .6+(1-colorVar)*.4
	draw_sprite_ext(spr_dq_light,0,x,y-zPosition,size*.5,size*.5,direction-90,merge_color(energyColor,c_black,colorVar),(1-colorVar)*.5)
	gpu_set_blendmode(bm_normal)
}