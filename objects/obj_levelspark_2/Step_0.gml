/// @description Insert description here
// You can write your code in this editor

colorVar =lerp(colorVar,1,.1)

if colorVar > .95 {
	instance_destroy()
}

//event_inherited()

image_xscale = ( 1 + spd/16)
image_yscale = ( 1 - spd/16)

//speed -= 1
spd = spd * .8

image_angle = direction
zPosition += spd
if instance_exists(target) {
	x = target.x
	y = target.y
}