/// @description Insert description here
// You can write your code in this editor

event_inherited()

var strLength = string_width(text)
var arrowDisplaceX = strLength/2 +10
var arrowDisplaceY = 8


var k = getSelection()

if isSelected {
	draw_sprite_ext(spr_shift_arrow,0,x+arrowDisplaceX,y+arrowDisplaceY,1,1,0,c_white,1)
	draw_sprite_ext(spr_shift_arrow,0,x-arrowDisplaceX,y+arrowDisplaceY,-1,1,0,c_white,1)
	scr_textStyle1(x,y+10,selection[k],font,align,selectedColor,alpha,size)
} else {
	draw_sprite_ext(spr_shift_arrow,1,x+arrowDisplaceX,y+arrowDisplaceY,1,1,0,c_white,1)
	draw_sprite_ext(spr_shift_arrow,1,x-arrowDisplaceX,y+arrowDisplaceY,-1,1,0,c_white,1)
	scr_textStyle1(x,y+10,selection[k],font,align,color,alpha,size)
}