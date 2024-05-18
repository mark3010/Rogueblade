/// @description Insert description here
// You can write your code in this editor

draw_set_color(merge_color(c_aqua,c_black,1))
draw_set_alpha(1)
draw_rectangle(x-800,y,x+800,y+1600,false)
draw_rectangle_color(x-obj_arena.baseWidth-obj_arena.baseRadius,y,x+obj_arena.baseWidth+obj_arena.baseRadius,y+obj_arena.baseRadius*5,c_dkgray,c_dkgray,c_black,c_black,false)