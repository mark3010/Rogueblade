
/// @function							scr_render3d(model)
/// @param {Model}		model			sprite stacking 3d model
/// @param {surface}	target 			surface to render final model output
/// @param {surface}	slice			surface to render final model output
/// @param {integer}	layer number	local layer number
/// @description						render sprite stack

function scr_render3d(argument0,argument1,argument2,argument3) {
	
	//setup
	var model = argument0.pattern
	var material = argument0.material
	
	var target = argument1
	var targetCenterX = surface_get_width(target)/2
	var targetCenterY = surface_get_height(target)/2
	
	var slice = argument2
	var sliceCenterX = surface_get_width(slice)/2
	var sliceCenterY = surface_get_height(slice)/2
	
	var color = argument3
	
	var localLayerNumber = 0 
	
	//animation
	var slopeAngleStrength = 0.5 // 0 is flat arena border, 1 is vertical arena border, 0.5 is 45 degree arena border
	var slantHAnim = -slantH * sign(obj_arena.x-x) * slopeAngleStrength * 20 // 90 is rotation at max slope slant
	var slantVAnim = slantV * sign(obj_arena.y-y) * slopeAngleStrength * .3 // .1 is stretch at max slope slant
	
	//variables to stretch surface
	var yTiltSkew = 1 - (1 - baseTiltY/100) + slantVAnim
	var xTiltSkew = 1
	
	//variables to change stack length
	var yTiltLengthMod = 1 - slantVAnim * 0.5
	
	//stack-camera view dispersion
	var viewCenterX = (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2)
	var viewCenterY = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2)
	
	//show_debug_message(stackCameraDispersionX)
	//var vx = camera_get_view_x(view_camera[0])
	//var vy = camera_get_view_y(view_camera[0])
	//render sprite stack model
	//description: models consists of circle mask and cutout pattern mask, because of this each step iterates i by +2!
	repeat(sprite_get_number(model)/2) {
		
		var iterationNumber = layerNumber*2
		
		//draw beyblade layer START----------------------
		surface_set_target(slice)
	
		//wipe
		draw_clear_alpha(c_blue,0)
		if global.debugMode draw_clear_alpha(c_blue,.4)

		//circle mask
		draw_sprite_ext(model,localLayerNumber,sliceCenterX,sliceCenterY,1,1,0,c_white,1)
			
		//material
		gpu_set_colorwriteenable(1,1,1,0)
		draw_sprite_ext(material,localLayerNumber/2,sliceCenterX,sliceCenterY,1,1,rotationAnim,c_white,1)
		gpu_set_colorwriteenable(1,1,1,1)

		//cutout pattern mask
		gpu_set_blendmode(bm_subtract)
		draw_sprite_ext(model,localLayerNumber+1,sliceCenterX,sliceCenterY,1,1,rotationAnim,c_white,1)
		gpu_set_blendmode(bm_normal)

		surface_reset_target()
		//draw beyblade layer END----------------------
	
		//draw layer to beyblade body
		surface_set_target(target)
		
		var stackCameraDispersionX =  0//(x - viewCenterX) / camera_get_view_width(view_camera[0]) * layerNumber / 2 //makes the stack lean relative to camera
		var stackCameraDispersionY =  0//(y - viewCenterY) / camera_get_view_height(view_camera[0]) * layerNumber   //makes the stack lean relative to camera
		
		var stackArenaDispersionX =  slantH * sign(obj_arena.x-x) * layerNumber / 2  //makes the stack lean relative to the arena
		var stackArenaDispersionY =  slantV * sign(obj_arena.y-y) * layerNumber / 10//makes the stack lean relative to the arena
		
		var stackTotalDispersionX = stackCameraDispersionX + stackArenaDispersionX
		var stackTotalDispersionY = stackCameraDispersionY + stackArenaDispersionY
		
		var layerToSurfaceCenterX = targetCenterX - sliceCenterX
		var layerToSurfaceCenterY = targetCenterY - sliceCenterY
		
		var layerStackLengthInterval = (iterationNumber/2) * yTiltLengthMod
		
		var targetLayerCenterX = layerToSurfaceCenterX + stackTotalDispersionX									+ 1 //center fix
		var targetLayerCenterY = layerToSurfaceCenterY + stackTotalDispersionY - 1 * layerStackLengthInterval	+ 1 //center fix
		
		if global.debugMode draw_circle(targetCenterX,targetCenterY,targetCenterX,true)
		
		draw_surface_ext(slice,targetLayerCenterX,targetLayerCenterY,xTiltSkew,yTiltSkew,0,color,1)
	
		if global.debugMode draw_circle(targetCenterX,targetCenterY,5,true)
		
		surface_reset_target()

		layerNumber++
		localLayerNumber+=2
	}
}