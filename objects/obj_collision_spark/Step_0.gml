/// @description Insert description here
// You can write your code in this editor

//event_inherited()

image_xscale = image_xscale -.2
image_yscale = image_yscale -.2

//speed -= 1
//speed = speed *.95

lifetime++

if lifetime >= deathTrigger {
	image_alpha -= .1
}

if image_xscale <= 0 {
	instance_destroy()
}
