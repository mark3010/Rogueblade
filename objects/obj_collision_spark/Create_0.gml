/// @description Insert description here
// You can write your code in this editor
event_inherited()
lifetime = 0
deathTrigger = 6
speed = 1
direction = irandom(359)
image_angle = direction
image_xscale = image_xscale*.2
image_yscale = image_yscale*.2

function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_light,0,x,y-zPosition,speed/2,speed/2,direction,energyColor,speed*speed*.5)
	gpu_set_blendmode(bm_normal)
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,direction,c_white,image_alpha)
}