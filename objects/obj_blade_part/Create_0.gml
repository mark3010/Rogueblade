/// @description Insert description here
// You can write your code in this editor

isCore = false
model = -1
lifeTime = 0
deathTrigger = 10
slantH = 1
slantV = 1
rotationAnim = 0
vel = [0,0]
dashPower = 0
//tweakable
slopeAngleStrengthY = 1.3		//tilt effect, higher => more tilt
slopeAngleStrengthX = 1.3		//tilt effect, higher => more tilt
baseTiltY = 1.5					//higher than 0 means more tilted towards north, 
rotationBaseSpeed = 8			//base animation speed for rotating blade
zRot = 0
zRotSpeed = 0
// other
slantH = 0
slantV = 0
animationTilt = [0,0] // variable that controls blade animation tilt axis 
animationTiltMovement = [0,0]
animationTiltArena = [0,0]
rotationAnim = 0

dragStrength = 0.1		// [1..0] where 1 is maximum drag effect, 0.1 allows ~50% speed increase
vel = [0,0,0]			// holds current velocity
velAdd = [0,0,0]		// holds temporary vector to add to velocity 
zPosition = 0

velVector = 0
dragVector = 0
velXSurplus = 0
velYSurplus = 0
onGround = false
shd_texel_handle = shader_get_uniform(shd_outline,"in_Texel")

stats = 0

function animationsCalculate() {
	rotationAnim += rotationBaseSpeed
	
	//HORISONTAL
	//animationTiltMovement[@ X] = lerp(animationTiltMovement[@ X],sign(velAdd[@ X]), stats.acc / stats.velMax)	// tilt for self acceleration
	//animationTiltArena[@ X] = sqrt(slantH) * sign(obj_arena.x-x) * slopeAngleStrengthX					// tilt for arena slopes
	
	//animationTilt[@ X] = animationTiltArena[@ X] + animationTiltMovement[@ X]
	
	//VERTICAL
	//animationTiltMovement[@ Y] = lerp(animationTiltMovement[@ Y],sign(velAdd[@ Y]),  stats.acc / stats.velMax)		// tilt for self acceleration
	//animationTiltArena[@ Y] = sqrt(slantV) * sign(obj_arena.y-y) * slopeAngleStrengthY - baseTiltY	// tilt for arena slopes									// adding some base tilt to spritestack
	
	//animationTilt[@ Y] = animationTiltArena[@ Y] + animationTiltMovement[@ Y]
}


function draw_me(sliceSurf, effectSurf, targetSurf) {
	#region ANIMATION
	var slopeAngleStrength = 0.5 // 0 is flat arena border, 1 is vertical arena border, 0.5 is 45 degree arena border
	var slantHAnim = slantH * sign(obj_arena.x-x) * slopeAngleStrength * 90 // 90 is rotation at max slope slant
	var slantVAnim = slantV * sign(obj_arena.y-y) * slopeAngleStrength * .3 // .1 is stretch at max slope slant
	#endregion
	
	if global.renderMode {
	// DRAW_ME V1

	if lifetime < 1 {exit}
	
	#region DRAW SHADOW
	var shadowX = x -(obj_arena.x - x) * 0.03
	var shadowY = y -(obj_arena.y - y) * 0.03
	draw_sprite_ext(spr_blade_base_shadow,0,shadowX,shadowY,1,1+slantVAnim,0-slantHAnim,c_white,.1) // draw self
	#endregion
	
	#region DRAW SELF
	shader_set(shd_outline)

	var texture = sprite_get_texture(sprite_index, image_index)
	var t_width = texture_get_texel_width(texture)
	var t_height = texture_get_texel_height(texture)

	shader_set_uniform_f(shd_texel_handle,t_width,t_height)

	draw_sprite_ext(sprite_index,0,x,y,1,1+slantVAnim,0-slantHAnim,c_white,1) // draw self
	
	shader_reset()

	#endregion
	} else {
	
	//DRAW_ME V2
	#region ANIMATION
	
	layerNumber = 0
	
	#region DRAW SHADOW
	var shadowX = x -(obj_arena.x - x) * 0.03
	var shadowY = y -(obj_arena.y - y) * 0.03
	
	var yTiltSkew = ( baseTiltY / 100 + slantVAnim - 0.8) / ( 1 + zPosition / 50 )
	var xTiltSkew = 1 / ( 1 + zPosition / 30 )
	
	if !(outOfBounds) {
		draw_sprite_ext(spr_blade_base_shadow,0,shadowX,shadowY,xTiltSkew,yTiltSkew,0,c_white,.1*image_alpha) // draw self
	}//scr_render3d_shadow(spr_blade_base_shadow)
	
	#endregion
	

	//generate model to target surface
	if variable_instance_exists(model,"core")	{scr_render3d_v2(model.core,targetSurf,sliceSurf,effectSurf,c_white,animationTilt,isCore)}
	else if variable_instance_exists(model,"hull")	{scr_render3d_v2(model.hull,targetSurf,sliceSurf,effectSurf,c_white,animationTilt,isCore)}

	//render settings for blade
	//shader_set(shd_outline)
	
	//var texture = surface_get_texture(targetSurf)
	//var t_width = texture_get_texel_width(texture)
	//var t_height = texture_get_texel_height(texture)

	//shader_set_uniform_f(shd_texel_handle,t_width,t_height)
	
	//render anchor point settings for surface
	var wm = matrix_get(matrix_world);          // Store this here, restore it later
	matrix_set(matrix_world, matrix_build(
	    x, y - zPosition, 0,
	    0, 0, -slantHAnim/1.5-animationTilt[X]*20,
	    1, 1, 1
	))
	
	//render blade
	draw_surface_ext(targetSurf,-surface_get_width(targetSurf)/2,-surface_get_height(targetSurf)/2,1,1,zRot,c_white,image_alpha)
	
	//reset matrix and shader
	matrix_set(matrix_world, wm)
	//shader_reset()
	
	//wipe surfaces
	surface_set_target(targetSurf)
	draw_clear_alpha(c_white,0)
	if global.debugMode draw_clear_alpha(c_red,.2)
	surface_reset_target()

	surface_set_target(sliceSurf)
	draw_clear_alpha(c_white,0)
	surface_reset_target()
	
	#endregion
	}
}
