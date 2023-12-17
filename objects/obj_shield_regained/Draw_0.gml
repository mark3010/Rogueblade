/// @description Insert description here
// You can write your code in this editor

var radius = ( deathTrigger - lifetime ) / 10 * size
var alpha = ( deathTrigger - lifetime ) / deathTrigger / 2

draw_set_color(color)
draw_set_alpha(alpha)


draw_circle(target.x,target.y,radius,false)

draw_set_color(c_white)
draw_set_alpha(1)