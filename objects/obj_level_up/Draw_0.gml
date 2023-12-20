/// @description Insert description here
// You can write your code in this editor

var centerDist =  lifetime  / deathTrigger * size
var alpha = ( deathTrigger - lifetime ) / deathTrigger

var triangleTop =	[0 + target.x,				-1 * centerDist + target.y - lifetime * 2]
var triangleLeft =	[-1 * centerDist+target.x,	0 + target.y - lifetime * 2]
var triangleRight = [1 * centerDist+target.x,	0 + target.y - lifetime * 2]

draw_set_color(color)
draw_set_alpha(alpha)

draw_triangle(triangleTop[X],triangleTop[Y],triangleLeft[X],triangleLeft[Y],triangleRight[X],triangleRight[Y],false)

draw_set_color(c_white)
draw_set_alpha(1)