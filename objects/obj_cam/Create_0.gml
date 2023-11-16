//STATES
enum cam_state
{
follow,
pan,
stick
}

state = cam_state.pan //default

panPoint = 20 // 1/panPoint distance between arena and target // PAN STATE ONLY

//VARIABLES
camWidth = 960
camHeight = 540

follow = noone

xTo = x
yTo = y

smoothStrength = 25 // higher is more smooth