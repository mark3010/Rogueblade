/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 20
speed = 8 +irandom(10)
direction = irandom(359)
image_angle = direction
image_xscale = image_xscale*(1+ irandom(50)/100)
image_yscale = image_yscale*(1+ irandom(50)/100)

function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_light,0,x,y-zPosition,image_xscale*.3,image_yscale*.3,direction,energyColor,.2)
	gpu_set_blendmode(bm_normal)
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,direction,c_white,1)
}