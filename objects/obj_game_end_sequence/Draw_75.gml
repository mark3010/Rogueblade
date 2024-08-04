/// @description Insert description here
// You can write your code in this editor

//scr_textStyle1(960/2,540/2-20,"The simulation has ended",global.font,fa_center,color,overlayText1Alpha*textDisplay,2)
scr_textStyle1(960/2,540/2+10,"You have been eliminated with a total score of: ",global.font,fa_center,color,overlayText2Alpha*textDisplay,1)
scr_textStyle1(960/2,540/2+30,string(endScore),global.font,fa_center,global.txtColPositive,overlayText2Alpha*textDisplay,1+(1-overlayText2Alpha))
//scr_textStyle1(960/2,540/2+120,"press ENTER to continue",global.font,fa_center,color,(1-sin(current_time/100)*.5)*overlayText3Alpha*textDisplay,1)
draw_set_alpha(1)