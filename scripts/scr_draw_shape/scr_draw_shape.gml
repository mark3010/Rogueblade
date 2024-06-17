/// @function					scr_draw_shape(x,y,shape[[x,y]],color,width);

function scr_draw_shape(argument0,argument1,argument2,argument3,argument4) {

	var xOrigin = argument0
	var yOrigin = argument1
	var shape = argument2
	var color =argument3
	var width = argument4

	for (var i = 0; i < array_length(shape); i++) {
		if i == array_length(shape)-1 {	// if last entry
			draw_line_width_color(xOrigin+shape[i][0],yOrigin+shape[i][1],xOrigin+shape[0][0],yOrigin+shape[0][1],width,color,color)
		} else {						// if normal entry
			draw_line_width_color(xOrigin+shape[i][0],yOrigin+shape[i][1],xOrigin+shape[i+1][0],yOrigin+shape[i+1][1],width,color,color)
		}
	}
}