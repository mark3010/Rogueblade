/// @description Insert description here
// You can write your code in this editor
//event_inherited()
sizeMod*=.7

image_xscale = (1 - sizeMod) *clamp(strength,0,20) /20
image_yscale = (1 - sizeMod) *clamp(strength,0,20) /20 * .7

lifetime++

if lifetime >= deathTrigger {
	image_alpha -= .1
}

if image_alpha <= 0 {
	instance_destroy()
}

color = merge_color(c_black,c_white,image_alpha)