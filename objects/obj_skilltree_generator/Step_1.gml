/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
event_inherited()

//ANIMATION VARIABLES
//ADJUST ANIMATIONS BASED ON SETTINGS
var _framerate = 60
var _speedAdjustment = 60 / _framerate // 60 is lowest framerate
interpolateCurveSpeedAdjusted = interpolateCurveSpeed * _speedAdjustment
interpolateZoomCurveSpeedAdjusted = interpolateZoomCurveSpeed * _speedAdjustment
//INTERPOLATION
//skilltree pan
if (interpolateCurvePosition < 1) {
	var _value = animcurve_channel_evaluate(interpolateChannel,interpolateCurvePosition)
	
	var _diffX = interpolateFillTarget[0] - array_get(interpolateFillStart,0)
	var _diffY = interpolateFillTarget[1] - array_get(interpolateFillStart,1)
	
	interpolateFill[0] = array_get(interpolateFillStart,0) + _diffX * _value
	interpolateFill[1] = array_get(interpolateFillStart,1) + _diffY * _value
	
	interpolateCurvePosition += interpolateCurveSpeedAdjusted
	
	if interpolateCurvePosition > 1 {interpolateCurvePosition = 1}
}

//skilltree zoom
//INTERPOLATION
if (interpolateZoomCurvePosition < 1) {
	var _value = animcurve_channel_evaluate(interpolateZoomChannel,interpolateZoomCurvePosition)
	
	var _diff = interpolateZoomFillTarget - interpolateZoomFillStart
	interpolateZoomFill = interpolateZoomFillStart + _diff * _value
	
	interpolateZoomCurvePosition += interpolateZoomCurveSpeedAdjusted
	
	if interpolateZoomCurvePosition > 1 {interpolateZoomCurvePosition = 1}
}



//panCurveSpeedAdjusted = panCurveSpeed * _speedAdjustment
//if (panCurvePosition < 1) {
//	panCurvePosition += panCurveSpeedAdjusted
//	var _value = animcurve_channel_evaluate(panChannel,panCurvePosition)
	
//	var _diffX = panFillTarget[0] - panFillStart[0]
//	var _diffY = panFillTarget[1] - panFillStart[1]

//	panFill[0] = panFillStart[0] + _diffX * _value
//	panFill[1] = panFillStart[1] + _diffY * _value
//}