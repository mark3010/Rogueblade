/// @description Insert description here
// You can write your code in this editor

if speed < .5 {
	instance_destroy()
}

event_inherited()

image_xscale = image_xscale * .9
image_yscale = image_yscale * .8

//speed -= 1
speed = speed * .85

image_angle = direction
//simulate gravity on trajectory
if direction > 90 and direction < 270 {
	direction++

} else {
	direction--
}

