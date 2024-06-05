/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_gray)
draw_set_halign(fa_center)
draw_text(x,y,"|")
scr_textStyle1(x-20,y,"skill Points: "+string(skillPoints),font,fa_right,color,alpha,size)
scr_textStyle1(x+20,y,"skill Blockers: "+string(skillBlockers),font,fa_left,color,alpha,size)
