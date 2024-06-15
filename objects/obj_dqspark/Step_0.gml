/// @description Insert description here
// You can write your code in this editor

if spd < 5 {
	colorVar =lerp(colorVar,1,.1)
}

if colorVar > .9 {
	instance_destroy()
}

event_inherited()

image_xscale = image_xscale * .95
image_yscale = image_yscale * .95

//speed -= 1
spd = spd * .90
zPosition += spd
x += lengthdir_x(spd,direction)
image_angle = direction