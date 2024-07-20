/// @description Insert description here
// You can write your code in this editor

//event_inherited()

image_xscale = image_xscale -.1
image_yscale = image_yscale -.1
image_alpha = image_xscale
//speed -= 1
//speed = speed *.95

lifetime++


if image_xscale <= 0 {
	instance_destroy()
}
