/// @description Insert description here
// You can write your code in this editor

//LIGHTING
if (!surface_exists(light_surface)) { 
	light_surface = surface_create(view_get_wport(view_current),view_get_hport(view_current))
}

var camera = view_get_camera(view_current)

surface_set_target(light_surface)
gpu_set_blendmode(bm_normal)

if instance_exists(obj_atmosphere) {
	darknessColor = obj_atmosphere.darknessColor
} else {var darknessColor = merge_color(c_dkgray,c_aqua,0.3)}

draw_clear_alpha(darknessColor,1)

camera_apply(camera)

gpu_set_blendmode(bm_normal)

//draw order is important
with (obj_spotlight) {
	draw_sprite_ext(self.lightSource,0,self.x,self.y,lightXScale,lightYScale,0,lightColor,lightAlpha)
}

with (obj_arena) {
	draw_light()
}

with (obj_blade) {
	var lightness = 1+1*clamp(self.zPosition,-120,0)/120 // to turn off light when falling off of arena
	draw_sprite_ext(spr_light,0,self.x,self.y-self.dimensions.zLength-zPosition,lightness,lightness,0,c_white,lightness)
}



gpu_set_blendmode(bm_normal)

surface_reset_target()

