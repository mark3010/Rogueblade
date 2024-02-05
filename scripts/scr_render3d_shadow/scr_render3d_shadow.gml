
/// @function							scr_render3d(model)
/// @param {sprite}		sprite			sprite stacking 3d model
/// @description						render shadow for 3d object

function scr_render3d_shadow(argument0) {
	//setup
	var shadow = argument0
	
	//animation
	var slopeAngleStrength = 0.5 // 0 is flat arena border, 1 is vertical arena border, 0.5 is 45 degree arena border
	var slantHAnim = -slantH * sign(obj_arena.x-x) * slopeAngleStrength * 90 // 90 is rotation at max slope slant
	var slantVAnim = slantV * sign(obj_arena.y-y) * slopeAngleStrength * .4 // .1 is stretch at max slope slant
	
	//variables to stretch surface
	var yTiltSkew = 1 - (1 - baseTiltY/100) + slantVAnim
	var xTiltSkew = 1
	
	//variables to change stack length
	var yTiltLengthMod = 1 - slantVAnim * 0.5

	//render shadow
	draw_sprite_ext(shadow,0,x,y,xTiltSkew,yTiltSkew,0,c_white,1)
}