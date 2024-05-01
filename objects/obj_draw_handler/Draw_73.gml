/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(light_surface)) { 
	light_surface = surface_create(view_get_wport(view_current),view_get_hport(view_current))
}

var camera = view_get_camera(view_current)

surface_set_target(light_surface)
gpu_set_blendmode(bm_normal)
draw_clear_alpha(c_gray,1)
camera_apply(camera)
gpu_set_blendmode(bm_add)

with (obj_blade) {

//var xN = x-view_get_xport(view_current)
//var yN = y-view_get_yport(view_current)
draw_sprite_ext(spr_light,0,self.x,self.y,1,1,0,c_white,1)


}
gpu_set_blendmode(bm_normal)

surface_reset_target()

