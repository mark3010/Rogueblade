/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 40
speed = 28 +irandom(10)
direction = 0
image_angle = direction
image_xscale = 1
image_yscale = 1

lightXScale = .3
lightYScale = .3
lightAlpha = 1
function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_light,0,x,y-zPosition,image_xscale,image_yscale*.5,direction,energyColor,.1)
	gpu_set_blendmode(bm_normal)
	
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,direction,c_white,1)
}