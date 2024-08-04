/// @description Insert description here
// You can write your code in this editor

//scr_textStyle1(960/2,540/2-20,"You are the Rogueblade champion!",global.font,fa_center,color,overlayAlpha*textDisplay,2)
var offsetY = -60
scr_textStyle1(960/2,540/2+10+offsetY,"Simulated Ascension level of #"+string(progress.difficultyLevel)+" cleared. Player progress level has been stored.",global.font,fa_center,color,overlayText2Alpha*textDisplay,1)
draw_sprite_ext(spr_ui_trophy,0,960/2,540/2+60+offsetY,1+(1-overlayText2Alpha),1+(1-overlayText2Alpha),0,c_white,overlayText2Alpha*textDisplay)
scr_textStyle1(960/2,540/2+110+offsetY,"Ascension level #"+string(progress.difficultyLevel+1)+" unlocked!",global.font,fa_center,global.txtColPositive,overlayText3Alpha*textDisplay,1+(1-overlayText3Alpha))
draw_set_alpha(1)