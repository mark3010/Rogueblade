/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 999
spd = 35 +irandom(16)
image_angle = direction
image_xscale = image_xscale*(1+ irandom(50)/100)*2
image_yscale = image_yscale*(1+ irandom(50)/100)
color = c_white
colorVar = 0

function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_light,0,x,y-zPosition,image_xscale*.3,image_yscale*.3,direction,merge_color(energyColor,c_black,colorVar),.2)
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,direction,merge_color(color,c_black,colorVar),1)
	gpu_set_blendmode(bm_normal)
}