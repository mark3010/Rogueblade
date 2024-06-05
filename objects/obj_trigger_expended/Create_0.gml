/// @description Insert description here
// You can write your code in this editor
event_inherited()
radiusMax = 90
radiusCurrent = 2

deathTrigger = 0
image_angle = direction
image_xscale = image_xscale*(1)
image_yscale = image_yscale*(1)

function draw_me(sliceSurf, effectSurf, targetSurf) {
	var radius = (10 - lifetime ) / 10
	var alpha = ( 10 - lifetime ) / 10 / 2
	//draw_set_color(lightColor)
	gpu_set_blendmode(bm_eq_add)
	//draw_sprite_ext(spr_light,0,target.x,target.y,radiusMax/radiusCurrent/45,radiusMax/radiusCurrent/45,0,lightColor,image_alpha)
	draw_set_alpha(image_alpha)
	draw_sprite_ext(spr_light,0,target.x,target.y-target.zPosition,radius,radius,direction,energyColor,alpha)
	draw_circle_color(target.x,target.y-target.zPosition,radiusCurrent,energyColor,energyColor,true)
	draw_circle_color(target.x,target.y-target.zPosition,radiusCurrent-1,energyColor,energyColor,true)
	draw_circle_color(target.x,target.y-target.zPosition,radiusCurrent-3,energyColor,energyColor,true)
	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)
}
