if global.debugMode {
draw_self()
}

switch (state) {
case cam_state.follow:
	if (follow != noone) {
		draw_text(x,y+40,"WE IIN FOLLOW MODE")
	}
	break;
}