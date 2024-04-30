/// @description Insert description here
// You can write your code in this editor
event_inherited()

image_xscale = image_xscale - .06
image_yscale = image_yscale - .06
image_angle = direction

if image_xscale <= 0 {
	instance_destroy()
}