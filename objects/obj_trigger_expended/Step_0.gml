/// @description Insert description here
// You can write your code in this editor

radiusCurrent = lerp(radiusCurrent,radiusMax,.15)

lifetime++

if lifetime > deathTrigger {
	image_alpha -= .1
}

if image_alpha < 0 {
	instance_destroy()
}