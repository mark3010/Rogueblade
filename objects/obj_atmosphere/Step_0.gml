/// @description Insert description here
// You can write your code in this editor
darknessColor = merge_color(darknessColor,darknessColorTarget,darknessColorLerpFloat)
layerBackgroundAlpha = lerp(layerBackgroundAlpha,1,.1)

//BACKGROUND EFFECT
for (var i = 0; i<array_length(currentBackdropEffect);i++) {
	if layer_get_fx(currentBackdropEffect[i]) != -1 {
		layer_set_visible(layer_get_id(currentBackdropEffect[i]),false)
	}
}

for (var i = 0; i < array_length(targetBackdropEffect); i++) {
	if layer_get_fx(targetBackdropEffect[i]) != -1 {
		layer_set_visible(layer_get_id(targetBackdropEffect[i]),true)
		//fx_get_parameter_names(targetBackdropEffect)

		//show_debug_message(fx_get_parameter(layer_get_fx(targetBackdropEffect),"g_Distort1Scale"))
		//show_debug_message(fx_get_parameter(layer_get_fx(targetBackdropEffect),"g_Distort2Scale"))
	
		var waveCamOffset = 1/obj_cam.zoomAnim
		//show_debug_message(waveCamOffset)
		var waveDistort1Scale = 1/obj_cam.zoomAnim //* 6
		//show_debug_message(waveDistort1Scale)
		var waveDistort2Scale = 1/obj_cam.zoomAnim //* 2
		//show_debug_message(waveDistort2Scale)
		if instance_exists(obj_cam) {
			fx_set_parameter(layer_get_fx(targetBackdropEffect[i]),"g_CamOffsetScale",waveCamOffset)
			fx_set_parameter(layer_get_fx(targetBackdropEffect[i]),"g_Distort1Scale",[20*waveDistort1Scale,2*waveDistort1Scale])
			fx_set_parameter(layer_get_fx(targetBackdropEffect[i]),"g_Distort2Scale",[100*waveDistort2Scale,10*waveDistort2Scale])
		}
	}
}

//BACKGROUND
if layer_background_get_id(currentBackdrop) != -1 {
	layer_background_alpha(layer_background_get_id(currentBackdrop),1-layerBackgroundAlpha)
}

if layer_background_get_id(targetBackdrop) != -1 {
	layer_background_alpha(layer_background_get_id(targetBackdrop),layerBackgroundAlpha)
}

//FOR TESTING BACKGROUNDS
if keyboard_check_pressed(vk_numpad0) {
	switchThemeLerp(AtmosphereTheme.DEFAULT)
	show_debug_message("DEFAULT ATMOSPHERE")
}
if keyboard_check_pressed(vk_numpad1) {
	switchThemeLerp(AtmosphereTheme.GREY)
	show_debug_message("GREY ATMOSPHERE")
}
if keyboard_check_pressed(vk_numpad2) {
	switchThemeLerp(AtmosphereTheme.BLUE)
	show_debug_message("BLUE ATMOSPHERE")
}
if keyboard_check_pressed(vk_numpad3) {
	switchThemeLerp(AtmosphereTheme.ORANGE)
	show_debug_message("ORANGE ATMOSPHERE")
}
if keyboard_check_pressed(vk_numpad4) {
	switchThemeLerp(AtmosphereTheme.GREEN)
	show_debug_message("GREEN ATMOSPHERE")
}