/// @description Insert description here
// You can write your code in this editor
event_inherited()

ds_depthgrid =	0


renderTarget = -1
renderSlice = -1
renderEffect = -1

function checkRenderSurfaces() {
	if (!surface_exists(renderTarget)) { 
		renderTarget = surface_create(32*3,32*3)
	}
	
	if (!surface_exists(renderSlice)) { 
		renderSlice = surface_create(32,32)
	}

	if (!surface_exists(renderEffect)) { 
		renderEffect = surface_create(32,32)
	}
}

checkRenderSurfaces()