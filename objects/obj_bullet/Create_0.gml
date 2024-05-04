/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 40
speed = 28 +irandom(10)
direction = 0
image_angle = direction
image_xscale = image_xscale*(1+ irandom(50)/100)
image_yscale = image_yscale*(1+ irandom(50)/100)

function draw_me(sliceSurf, effectSurf, targetSurf) {
	//shader_set(shd_flash)
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,direction,lightColor,1)
	//shader_reset()
}