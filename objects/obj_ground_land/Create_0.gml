/// @description Insert description here
// You can write your code in this editor
event_inherited()

image_xscale =0
image_yscale =0
image_alpha=1
image_speed = 0
sizeMod = 1
strength = 1
lifetime= 0
deathTrigger=6
color = c_white

function draw_me(a,b,c) {
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,color,image_alpha)
	gpu_set_blendmode(bm_normal)
}