/// @description Insert description here
// You can write your code in this editor
event_inherited()
speed = 1
image_speed = 1
image_xscale =1
image_yscale =1
color = c_white
function draw_me(a,b,c) {
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,color,image_alpha)
	gpu_set_blendmode(bm_normal)
}