/// @description Insert description here
// You can write your code in this editor
event_inherited()

deathTrigger = 10
image_angle = direction
image_xscale = 1.5
image_yscale = 1.5

function draw_me() {
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale,image_yscale,0,c_orange,1)
	draw_sprite_ext(spr_death,0,x,y-zPosition,image_xscale,image_yscale*2,0,c_orange,1)
}