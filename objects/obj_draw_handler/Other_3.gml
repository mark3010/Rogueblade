/// @description Insert description here
// You can write your code in this editor
if(ds_exists(ds_depthgrid, ds_type_grid)){
	ds_grid_destroy(ds_depthgrid);
}

if (surface_exists(renderTarget)) { 
	surface_free(renderTarget)
}
	
if (surface_exists(renderSlice)) { 
	surface_free(renderSlice)
}

if (surface_exists(renderEffect)) { 
	surface_free(renderEffect)
}

if (surface_exists(game_surface)) { 
	surface_free(game_surface)
}