/// @description Insert description here
// You can write your code in this editor

colorVar =lerp(colorVar,1,.015)



if colorVar > .95 {
	instance_destroy()
}

if instance_exists(target) {
	x = target.x
	y = target.y
}

event_inherited()