/// @description Insert description here
// You can write your code in this editor
if sprite_exists(pauseScreen) {
	darknessColorVar = lerp(darknessColorVar,1,.1)
	//var sha = shd_blur;
	//shader_set(sha);
	//shader_set_uniform_f(shader_get_uniform(sha,"size"), 0.3); // can be a variable or even put in the shader instead of a uniform

	draw_sprite_ext(pauseScreen,0,0,0,1,1,0,merge_color(c_white,c_dkgray,darknessColorVar),1)
	
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(pauseScreenLight,0,0,0,1,1,0,merge_color(c_white,c_ltgray,darknessColorVar),.05)
	
	gpu_set_blendmode(bm_normal)
	gpu_set_blendmode_ext(bm_dest_color,bm_zero)
	draw_sprite_ext(pauseScreenLight,0,0,0,1,1,0,merge_color(c_white,c_ltgray,darknessColorVar),1)
	gpu_set_blendmode(bm_normal)
	

	//shader_reset();
	//draw_sprite(pauseScreenLight,0,xCorner,yCorner)
} else {
	darknessColorVar = 0
}

/*
var _fx_struct = layer_get_fx("fx_gaussian");

if (_fx_struct != -1)
{
	var _params = fx_get_parameters(_fx_struct);
	_params.g_intensity = gaussianIntensity;

	fx_set_parameters(_fx_struct, _params);
}

if instance_exists(obj_arena) {
	gaussianIntensity = 0
} else {
	gaussianIntensity += 0.01
	if gaussianIntensity > 1 {gaussianIntensity = 1}
}