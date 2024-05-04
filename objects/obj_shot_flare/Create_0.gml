/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 10
image_angle = direction
image_xscale = image_xscale*(.5)
image_yscale = image_yscale*(.5)

function draw_me(sliceSurf, effectSurf, targetSurf) {
	//shader_set(shd_flash)
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,direction,c_white,1)
	//shader_reset()
}