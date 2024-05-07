/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 10
image_angle = direction
image_xscale = image_xscale*(.5)
image_yscale = image_yscale*(.5)

function draw_me(sliceSurf, effectSurf, targetSurf) {
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_light,0,x,y-zPosition,image_xscale*.5,image_yscale*.5,direction,energyColor,.2)
	gpu_set_blendmode(bm_normal)
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,direction,c_white,1)

}