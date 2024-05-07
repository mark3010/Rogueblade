/// @description Insert description here
// You can write your code in this editor

//draw game surface
draw_surface_stretched(application_surface,0,0,window_get_width(),window_get_height())


//draw light surface
if instance_exists(obj_gameinit) {
	var alpha = .1
	gpu_set_blendmode(bm_add)
	draw_surface_stretched_ext(self.light_surface,0,0,window_get_width(),window_get_height(),c_white,.05)
	gpu_set_blendmode(bm_normal)
	if !global.debugLight	{gpu_set_blendmode_ext(bm_dest_color,bm_zero)
							 alpha = 1
							}
	else					{gpu_set_blendmode(bm_normal)}

	
	draw_surface_stretched_ext(self.light_surface,0,0,window_get_width(),window_get_height(),c_white,alpha)
	gpu_set_blendmode(bm_normal)
	
}