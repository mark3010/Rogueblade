
/// @function							scr_render3d(model)
/// @param {Model}		model			sprite stacking 3d model
/// @param {surface}	target 			surface to render final model output
/// @param {surface}	slice			surface to render sprite stack slice
/// @param {surface}	effect			surface to render sprite stack slice effect
/// @param {hex}		color			render color
/// @param {array}		tilt 			array containing animation tilt
/// @param {bool}		boolean			overlay sprite on top
/// @description						render sprite stack

function scr_render3d_v2(argument0,argument1,argument2,argument3,argument4,argument5=[0,0],argument6=false) {
	
	//setup
	var model = argument0.pattern
	var material = argument0.material
	
	var target = argument1
	var targetCenterX = surface_get_width(target)/2
	var targetCenterY = surface_get_height(target)/2
	
	var slice = argument2
	var sliceCenterX = surface_get_width(slice)/2
	var sliceCenterY = surface_get_height(slice)/2
	
	var effect = argument3
	var effectCenterX = surface_get_width(effect)/2
	var effectCenterY = surface_get_height(effect)/2
	
	var color = argument4
	
	var tilt = argument5
	
	var overlayFlag = argument6
	
	var localLayerNumber = 0 
	
	//animation
	//variables to stretch surface
	var yTiltSkew = 1 + tilt[Y] * 0.2 // - (1 - baseTiltY/100) + slantVAnim ADD TO TILT
	var xTiltSkew = 1

	//variables to change stack length
	var yTiltLengthMod = 1 - tilt[Y] * 0.3
	
	//render sprite stack model
	//description: models consists of circle mask and cutout pattern mask, because of this each step iterates i by +2!
	
	surface_set_target(slice) // slice layer for each sprite in stack
	
	repeat(sprite_get_number(model)/2) {
		
		var iterationNumber = layerNumber*2
				
		var layerToSurfaceCenterX = targetCenterX - sliceCenterX + slantH * sign(obj_arena.x-x) * layerNumber / 10
		var layerToSurfaceCenterY = targetCenterY - sliceCenterY + slantV * sign(obj_arena.y-y) * layerNumber / 10
		
		var layerStackLengthIntervalY = (iterationNumber/2) * yTiltLengthMod
		
		var targetLayerCenterX = layerToSurfaceCenterX									+ 1 //center fix
		var targetLayerCenterY = layerToSurfaceCenterY - 1 * layerStackLengthIntervalY	+ 1 //center fix
		
		var rotationSpeed = rotationAnim
		
		//draw sprite stack layer START----------------------
		
		// if script has overlay arg ---------------------------
		// !REDO THIS PART LATER!
		
		if overlayFlag //&& localLayerNumber==sprite_get_number(model)/2 
		{
			draw_clear_alpha(c_blue,0)
			rotationSpeed = - rotationSpeed * 0.3
			
			//circle mask
			draw_sprite_ext(model,0,sliceCenterX,sliceCenterY,1,1,0,c_white,1)
			
			//material
			gpu_set_colorwriteenable(1,1,1,0)
			draw_sprite_ext(spr_core_lid,0,sliceCenterX,sliceCenterY,1,1,0,c_white,1)
			gpu_set_colorwriteenable(1,1,1,1)
			
			//draw lid
			surface_set_target(target)
			draw_surface_ext(slice,targetLayerCenterX,targetLayerCenterY,xTiltSkew,yTiltSkew,0,color,1)
			surface_reset_target()
		}
		//-----------------------------------------------------------
		
		//wipe surface 
		draw_clear_alpha(c_blue,0)
		//if global.debugMode draw_clear_alpha(c_blue,.4)
		
		//circle mask
		draw_sprite_ext(model,localLayerNumber,sliceCenterX,sliceCenterY,1,1,0,c_white,1)
			
		//material
		gpu_set_colorwriteenable(1,1,1,0)
		draw_sprite_ext(material,localLayerNumber/2,sliceCenterX,sliceCenterY,1,1,rotationSpeed,c_white,1)
		gpu_set_colorwriteenable(1,1,1,1)

		//cutout pattern mask
		gpu_set_blendmode(bm_subtract)
		draw_sprite_ext(model,localLayerNumber+1,sliceCenterX,sliceCenterY,1,1,rotationSpeed,c_white,1)
		gpu_set_blendmode(bm_normal)

		//draw beyblade layer END----------------------
	
		//draw layer to beyblade body
		surface_set_target(target)
		
		//if global.debugMode draw_circle(targetCenterX,targetCenterY,targetCenterX,true)
		
		/*if overlayFlag && localLayerNumber==sprite_get_number(model)/2 {
			//draw to effect layer, and apply effects
			surface_set_target(effect)
			draw_clear_alpha(c_white,0)
			draw_surface_ext(slice,0,0,xTiltSkew,yTiltSkew,0,color,1)
			
			surface_reset_target()
			
			//draw to stack with shader
			shader_set(shd_inline)
			
			var texture = surface_get_texture(slice)
			var t_width = texture_get_texel_width(texture)
			var t_height = texture_get_texel_height(texture)
			shader_set_uniform_f(shd_texel_handle,t_width,t_height)	
			
			draw_surface_ext(effect,targetLayerCenterX,targetLayerCenterY,1,1,0,c_white,1)
			
			shader_reset()
		} else {*/
			draw_surface_ext(slice,targetLayerCenterX,targetLayerCenterY,xTiltSkew,yTiltSkew,0,color,1)
			
		//}
	
		if global.debugMode draw_circle(targetCenterX,targetCenterY,5,true)
		
		surface_reset_target()

		layerNumber++
		localLayerNumber+=2
	}
	
	surface_reset_target()
}