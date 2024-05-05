/// @description Insert description here
// You can write your code in this editor

//LIGHTING
if (!surface_exists(light_surface)) { 
	light_surface = surface_create(view_get_wport(view_current),view_get_hport(view_current))
}

var camera = view_get_camera(view_current)

surface_set_target(light_surface)
gpu_set_blendmode(bm_normal)

var darknessColor = merge_color(c_gray,c_blue,0.2)
//var darknessColor = merge_color(c_dkgray,c_blue,0.3)
//var darknessColor = merge_color(c_gray,c_green,0.3)
draw_clear_alpha(darknessColor,1)

camera_apply(camera)

gpu_set_blendmode(bm_normal)

//draw order is important
with (obj_spotlight) {
	draw_sprite_ext(self.lightSource,0,self.x,self.y,1,1,0,lightColor,.9)
}

with (obj_blade) {
	draw_sprite_ext(spr_light,0,self.x,self.y-self.dimensions.zLength-zPosition,1,1,0,c_white,.8)
}

with (obj_effect_depth) {
	draw_sprite_ext(self.lightSource,0,self.x,self.y,1,1,0,lightColor,1)
}

gpu_set_blendmode(bm_normal)

surface_reset_target()

