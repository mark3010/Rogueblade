switch (state) {
case cam_state.follow:
	if (follow != noone) {
		xTo = follow.x
		yTo = follow.y
	}
	break;
case cam_state.pan:
	if (follow != noone) {
		xTo = obj_arena.x - (obj_arena.x - follow.x) / panPoint
		yTo = obj_arena.y - (obj_arena.y - follow.y) / panPoint
	}
	break;
case cam_state.stick:
	xTo = x
	yTo = y
	break;
}



x += (xTo - x) / smoothStrength
y += (yTo - y) / smoothStrength

camera_set_view_pos(view_camera[0], x - (camWidth * 0.5), y - (camHeight * 0.5))