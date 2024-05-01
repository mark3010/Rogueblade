/// @description Insert description here
// You can write your code in this editor
draw_surface_stretched(application_surface,0,0,window_get_width(),window_get_height())
//draw_surface(self.light_surface,0,0)
draw_set_alpha(.7)
gpu_set_blendmode_ext(bm_dest_color,bm_zero);
draw_surface_stretched(self.light_surface,0,0,window_get_width(),window_get_height())
gpu_set_blendmode(bm_normal)
draw_set_alpha(1)