/// @description Insert description here
// You can write your code in this editor

lifetime++

if lifetime >= deathTrigger {
	colorVar =lerp(colorVar,1,.1)
} else {
	colorVar =lerp(colorVar,0,.1)
}

if spd > .25 {
	spd = spd * .85
}

if lifetime >= deathTrigger && colorVar > .9 {
	instance_destroy()
}

zPosition += spd

if instance_exists(target) {
	x = target.x
	y = target.y
}
