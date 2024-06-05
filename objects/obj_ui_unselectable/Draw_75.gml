/// @description Insert description here
// You can write your code in this editor
if triggerKey != noone {
	alphaMod = alpha * (0.5 + abs(sin(current_time/100))*.5)
} else {
	alphaMod = alpha
}

scr_textStyle1(x,y,text,font,align,color,alphaMod,size)
