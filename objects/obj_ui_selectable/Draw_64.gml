/// @description Insert description here
// You can write your code in this editor

if isSelected {
	
	draw_sprite_ext(spr_menu_highlight,0,x,y+6,popMod,popMod,0,c_white,alpha)
	draw_set_color(selectedColor)
	draw_set_alpha(alpha)
	draw_set_halign(fa_center)
	draw_set_font(font_silver)
	draw_text(x,y,text)
	//scr_textStyle1(x,y,text,font,align,selectedColor,alpha,size)
} else {
	scr_textStyle1(x,y,text,font,align,color,alpha,size)
}