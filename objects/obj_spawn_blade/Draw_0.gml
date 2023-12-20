/// @description Insert description here
// You can write your code in this editor
var alpha = .6

draw_set_color(color)
draw_set_alpha(alpha)

draw_rectangle(-1*centerDist+target.x,1*centerDist+target.y,1*centerDist+target.x,-1*centerDist+target.y, false)
draw_rectangle(-1*size+target.x,1*size+target.y,1*size+target.x,-1*size+target.y, true)

draw_set_color(c_white)
draw_set_alpha(1)