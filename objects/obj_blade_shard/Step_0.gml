/// @description Insert description here
// You can write your code in this editor

image_yscale = cos(yScaleSpeed*lifetime/200)
image_xscale = cos(xScaleSpeed*lifetime/200)
image_angle += rotationSpeed/200
y += 1
lifetime++

if lifetime >= deathTrigger {
	image_alpha -= .1
}

if image_alpha <= 0 {
	instance_destroy()
}