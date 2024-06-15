event_inherited()

if(ds_exists(ds_depthgrid, ds_type_grid)){

	//sort the grid by Y value (lowest Y values first)
	ds_grid_sort(ds_depthgrid, 1, true)

	//draw all of the instances in order (lowest Y value first)
	for(var yy = 0; yy < ds_grid_height(ds_depthgrid); yy += 1){
		 
		//draw the instance
		var instanceID = ds_depthgrid[# 0, yy]
		with(instanceID){
			
			try {	//for whatever fucking reason scribble makes it so some of the first depthgrid lists are malformed, 
					//leading to calling functions in object "0". this alliviates the problem
				draw_me(obj_draw_handler.renderSlice,obj_draw_handler.renderEffect,obj_draw_handler.renderTarget)
				
			} catch(_exception) {
				show_debug_message(_exception)
			}
		}
	}

	ds_grid_destroy(ds_depthgrid)
}
