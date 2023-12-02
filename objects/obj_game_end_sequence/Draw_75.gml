/// @description Insert description here
// You can write your code in this editor


draw_set_alpha(overlayAlpha)
draw_set_color(c_black)
draw_rectangle(0,0,960,540,false)
scr_textStyle1(960/2,540/2-20,"IT'S SO OVER.",font_silkscreen,fa_center,c_white,overlayText1Alpha,2)
scr_textStyle1(960/2,540/2+10,"you died.",font_silkscreen,fa_center,c_white,overlayText2Alpha,1)
draw_set_alpha(1)