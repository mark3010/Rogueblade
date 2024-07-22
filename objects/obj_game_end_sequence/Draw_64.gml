/// @description Insert description here
// You can write your code in this editor


draw_set_alpha(overlayAlpha)
draw_text(x,y+20,"y: "+string(y))
draw_text(x,y+30,"x: "+string(x))
draw_set_color(c_black)
draw_rectangle(0,0,960,540,false)
scr_textStyle1(960/2,540/2-20,"IT'S SO OVER.",global.font,fa_center,color,overlayText1Alpha*textDisplay,2)
scr_textStyle1(960/2,540/2+10,"you died.",global.font,fa_center,color,overlayText2Alpha*textDisplay,1)
scr_textStyle1(960/2,540/2+120,"press ENTER to continue",global.font,fa_center,color,(1-sin(current_time/100)*.5)*overlayText3Alpha*textDisplay,1)
draw_set_alpha(1)