if !instance_exists(follow) {
	follow = noone
}

switch (state) {
case camState.FOLLOW:
	if (follow != noone) {
		xTo = follow.x
		yTo = follow.y
	}
	break;
case camState.PAN:
	if (follow != noone) {
		xTo = obj_arena.x - (obj_arena.x - follow.x) / panPoint
		yTo = obj_arena.y - (obj_arena.y - follow.y) / panPoint
	}
	break;
case camState.STICK:
	xTo = x
	yTo = y
	break;
}

x += (xTo - x) / smoothStrength
y += (yTo - y) / smoothStrength

camera_set_view_pos(view_camera[0], x - (camWidth * 0.5), y - (camHeight * 0.5))