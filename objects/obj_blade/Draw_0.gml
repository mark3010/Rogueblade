//CALCULATION STEP//
	var slopeAngleStrength = 0.5 // 0 is flat arena border, 1 is vertical arena border, 0.5 is 45 degree arena border
	
	var slantHAnim = slantH * sign(obj_arena.x-x) * slopeAngleStrength * 90 // 90 is rotation at max slope slant
	var slantVAnim = slantV * sign(obj_arena.y-y) * slopeAngleStrength * .3 // .1 is stretch at max slope slant

//DRAW STEP//
draw_sprite_ext(sprite_index,image_index,x,y,1*global.renderSize,1*global.renderSize+slantVAnim,0-slantHAnim,c_white,1) // draw self

//DEBUG STUFF
if global.debugMode {
	//arena breakpoints
	draw_set_color(c_red)
	draw_circle(arenaFlatBorderX,arenaFlatBorderY,3,true)

	draw_set_color(c_green)
	draw_circle(arenaSlopedBorderX,arenaSlopedBorderY,3,true)

	draw_set_color(c_blue)
	draw_circle(arenaBaseX,arenaBaseY,3,true)
	
	//velocity vector
	draw_text(x,y,"velocity: "+string(velVector))
	draw_text(x,y+10,"drag: "+string(dragVector))

}
