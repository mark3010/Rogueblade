/// @description Insert description here
// You can write your code in this editor
event_inherited()

global.debugLight = false

game_surface = -1
game_surface_x = 960
game_surface_y = 540
ds_depthgrid =	0
renderTarget = -1
renderSlice = -1
renderEffect = -1
light_surface = -1

function checkRenderSurfaces() {
	if (!surface_exists(game_surface)) { 
		game_surface = surface_create(game_surface_x,game_surface_y)
	}
	if (!surface_exists(renderTarget)) { 
		renderTarget = surface_create(32*6,32*6)
	}
	
	if (!surface_exists(renderSlice)) { 
		renderSlice = surface_create(64,64)
	}

	if (!surface_exists(renderEffect)) { 
		renderEffect = surface_create(32,32)
	}
	
	if (!surface_exists(light_surface)) { 
		light_surface = surface_create(view_get_wport(view_current),view_get_hport(view_current))
	}
}

checkRenderSurfaces()

//lighting
application_surface_draw_enable(false)
