/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 20
spd = 10 +irandom(200)/10
target = obj_player
colorVar = 0
xOffset = 0
direction = 90
image_angle = direction
image_xscale = 1
image_yscale = 1

function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_light,0,x+xOffset,y-zPosition,1*.3,1*.3,direction,merge_color(energyColor,c_black,colorVar),(1-colorVar)*.3)
	draw_sprite_ext(sprite_index,0,x+xOffset,y-zPosition,image_xscale,image_yscale,direction,c_white,1-colorVar)
	gpu_set_blendmode(bm_normal)
	
}