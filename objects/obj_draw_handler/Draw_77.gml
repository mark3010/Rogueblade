/// @description Insert description here
// You can write your code in this editor
draw_surface_stretched(application_surface,0,0,window_get_width(),window_get_height())

if !global.debugLight	{gpu_set_blendmode_ext(bm_dest_color,bm_zero)}
else					{gpu_set_blendmode(bm_normal)}

draw_surface_stretched(self.light_surface,0,0,window_get_width(),window_get_height())
gpu_set_blendmode(bm_normal)
