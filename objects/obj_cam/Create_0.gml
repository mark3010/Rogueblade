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