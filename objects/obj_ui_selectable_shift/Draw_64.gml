/// @description Insert description here
// You can write your code in this editor
var strWidth = string_width(text)
var strHeight = 36
var lineStartX = strWidth/2+12
var lineStartY = strHeight/2+2
var descriptionWidth = 100
var arrowDisplaceX = descriptionWidth/1.6
var arrowDisplaceY = 2


var selectedTextDisplay = name(getSelection())

if isSelected {
	//TITLE
	scr_textStyle1(x,y+lineStartY-6,text,font,align,color,alpha,size)
	draw_set_color(color)
	draw_line(x+lineStartX,y+lineStartY,x+descriptionWidth,y+lineStartY)
	draw_line(x-lineStartX,y+lineStartY,x-descriptionWidth,y+lineStartY)
	
	var shiftLeftAnimMod = 1 + shiftLeftAnim * .2
	var shiftRightAnimMod = 1 + shiftRightAnim * .2
	draw_sprite_ext(spr_menu_highlight,1,x,y+6+strHeight,popMod,popMod,0,c_white,alpha)
	draw_sprite_ext(spr_shift_arrow,0,x+arrowDisplaceX*shiftRightAnimMod,y+strHeight+arrowDisplaceY,1,1,0,selectedColor,alpha)
	draw_sprite_ext(spr_shift_arrow,0,x-arrowDisplaceX*shiftLeftAnimMod,y+strHeight+arrowDisplaceY,-1,1,0,selectedColor,alpha)
	
	draw_set_color(selectedColor)
	draw_set_alpha(alpha)
	draw_set_halign(fa_center)
	draw_set_font(font_silver)
	draw_text(x,y+strHeight,selectedTextDisplay)
	//scr_textStyle1(x,y+strHeight,selectedTextDisplay,font,align,selectedColor,alpha,size)
} else {
	scr_textStyle1(x,y+lineStartY-6,text,font,align,color,alpha,size)
	draw_set_color(color)
	draw_line(x+lineStartX,y+lineStartY,x+descriptionWidth,y+lineStartY)
	draw_line(x-lineStartX,y+lineStartY,x-descriptionWidth,y+lineStartY)
	
	draw_sprite_ext(spr_shift_arrow,0,x+arrowDisplaceX,y+strHeight+arrowDisplaceY,1,1,0,color,alpha)
	draw_sprite_ext(spr_shift_arrow,0,x-arrowDisplaceX,y+strHeight+arrowDisplaceY,-1,1,0,color,alpha)
	scr_textStyle1(x,y+strHeight,selectedTextDisplay,font,align,color,alpha,size)
}