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

//zoom interpolate
//INTERPOLATION
if (interpolateCurvePosition < 1) {
	var _value = animcurve_channel_evaluate(interpolateChannel,interpolateCurvePosition)
	
	var _diff = interpolateFillTarget - interpolateFillStart
	interpolateFill = interpolateFillStart + _diff * _value
	
	interpolateCurvePosition += interpolateCurveSpeed
	
	if interpolateCurvePosition > 1 {interpolateCurvePosition = 1}
}

var zoomCurveFunction = (zoomLevel-1) * (interpolateFill)
var zoomPlayerDash = 0
var zoomPlayerZPosition = 0

if instance_exists(obj_player)==true {
	zoomPlayerDash = - obj_player.dashPower/1000
	zoomPlayerZPosition = obj_player.zPosition
	}

zoomPlayerDashAnim = lerp(zoomPlayerDashAnim,zoomPlayerDash,.05)
zoomPlayerZPositionAnim = lerp(zoomPlayerZPositionAnim,zoomPlayerZPosition/1000,.05)
zoomCustomAnim = lerp(zoomCustomAnim,zoomCustom,.1)

zoomAnim = 1 + zoomCurveFunction + zoomPlayerDashAnim + zoomPlayerZPositionAnim + zoomCustomAnim

camera_set_view_pos(view_camera[0], x - (camWidth * 0.5 * zoomAnim), y - (camHeight * 0.5 * zoomAnim))
camera_set_view_angle(view_camera[0],twist)
camera_set_view_size(view_camera[0],camWidth*zoomAnim,camHeight*zoomAnim)


//rotation
twist = lerp(0,twist,0.9)

//shake
if (shake) 
{ 
   shake_time -= 1
   var _xval = choose(-shake_magnitude, shake_magnitude)
   var _yval = choose(-shake_magnitude, shake_magnitude) 
   camera_set_view_pos(view_camera[0], x - (camWidth * 0.5 * zoomAnim)+_xval, y - (camHeight * 0.5 * zoomAnim)+_yval)

   if (shake_time <= 0) 
   { 
      shake_magnitude -= shake_fade 

      if (shake_magnitude <= 0) 
      {  
		camera_set_view_pos(view_camera[0], x - (camWidth * 0.5 * zoomAnim), y - (camHeight * 0.5 * zoomAnim))
		shake = false 
      } 
   } 
}