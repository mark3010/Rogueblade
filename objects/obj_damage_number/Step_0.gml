/// @description Insert description here
// You can write your code in this editor

lifetime++

if lifetime >= deathTrigger {
	image_alpha -= .05
}

if image_alpha <= 0 {
	instance_destroy()
}