/// @description Insert description here
// You can write your code in this editor

event_inherited()

//image_xscale = image_xscale * .9
//image_yscale = image_yscale * .8
//speed = speed * .95
turnAngle = lerp(turnAngle,0,0.02)
direction += turnAngle
image_angle = direction