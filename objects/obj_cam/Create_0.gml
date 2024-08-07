//STATES
enum camState
{
	FOLLOW,
	PAN,
	STICK
}

state = camState.PAN //default
panPoint = 5 // 1/panPoint distance between arena and target // PAN STATE ONLY

//VARIABLES
camWidth = 960
camHeight = 540

follow = noone

xTo = x
yTo = y

smoothStrength = 25 // higher is more smooth


zoomAnim = 1
//zoom
zoomLevel = 1
interpolateFill = 0
interpolateFillTarget = 0
interpolateFillStart = 0

interpolateCurveStruct = animcurve_get(AC_EaseIn)
interpolateChannel = animcurve_get_channel(interpolateCurveStruct,0)

interpolateCurvePosition = 0
interpolateCurveSpeed = 0.0

zoomPlayerDashAnim = 0
zoomPlayerZPositionAnim = 0
//rotation
playerTorqueStrength = 0
twist = 0

//shake
shake = false
shake_time = 0
shake_magnitude = 0
shake_fade = 0.25

zoomCustom = 0
zoomCustomAnim = 0

function followTarget(instance) {
	follow = instance
	state = camState.FOLLOW
}
function pan() {
	state = camState.PAN
}

function screenshake(_time, _magnitude, _fade) {
	shake = true
	shake_time = _time
	shake_magnitude = _magnitude
	shake_fade = _fade
}

function torque(add) {
	twist += add * playerTorqueStrength
}

function zoomIn() {
	zoomLevel = 2.5
	interpolateFill = 0
	interpolateFillTarget = 1
	interpolateFillStart = 0

	interpolateCurveStruct = animcurve_get(AC_EaseIn)
	interpolateChannel = animcurve_get_channel(interpolateCurveStruct,0)

	interpolateCurvePosition = 0
	interpolateCurveSpeed = 0.005
}

function zoomOut() {
	zoomLevel = 3
	interpolateFill = 0
	interpolateFillTarget = 1
	interpolateFillStart = 0

	interpolateCurveStruct = animcurve_get(AC_EaseOut)
	interpolateChannel = animcurve_get_channel(interpolateCurveStruct,0)

	interpolateCurvePosition = 0
	interpolateCurveSpeed = 0.01
}

function zoomAdd(number) {
	zoomCustom = number
}

zoomIn()

function focus(objectId){
	follow = objectId
}