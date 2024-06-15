/// @description Insert description here
// You can write your code in this editor
event_inherited()
startPoint = [x,y]
maxDistance = 200
deathTrigger = 200
speed = 3.5
image_angle = direction
image_xscale = 1
image_yscale = 1
image_speed = 0
image_index = irandom(sprite_get_number(sprite_index))

color = c_black

function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(sprite_index,image_index,x,y-zPosition,image_xscale,image_yscale,direction,color,1)
	gpu_set_blendmode(bm_normal)
}