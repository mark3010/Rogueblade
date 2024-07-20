/// @description Insert description here
// You can write your code in this editor

colorVar =lerp(colorVar,1,.03)

if colorVar > .95 {
	instance_destroy()
}

event_inherited()