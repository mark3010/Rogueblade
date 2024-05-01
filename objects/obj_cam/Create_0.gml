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

//zoom
zoomLevel = 1
interpolateFill = 0
interpolateFillTarget = 0
interpolateFillStart = 0

interpolateCurveStruct = animcurve_get(AC_EaseIn)
interpolateChannel = animcurve_get_channel(interpolateCurveStruct,0)

interpolateCurvePosition = 0
interpolateCurveSpeed = 0.0

//rotation
playerTorqueStrength = 0
twist = 0

function torque(add) {
	twist += add * playerTorqueStrength
}

function zoomIn() {
	zoomLevel = 2
	interpolateFill = 0
	interpolateFillTarget = 1
	interpolateFillStart = 0

	interpolateCurveStruct = animcurve_get(AC_EaseIn)
	interpolateChannel = animcurve_get_channel(interpolateCurveStruct,0)

	interpolateCurvePosition = 0
	interpolateCurveSpeed = 0.01
}

function zoomOut() {
	zoomLevel = 2
	interpolateFill = 0
	interpolateFillTarget = 1
	interpolateFillStart = 0

	interpolateCurveStruct = animcurve_get(AC_EaseOut)
	interpolateChannel = animcurve_get_channel(interpolateCurveStruct,0)

	interpolateCurvePosition = 0
	interpolateCurveSpeed = 0.01
}

zoomIn()

function focus(objectId){
	follow = objectId
}