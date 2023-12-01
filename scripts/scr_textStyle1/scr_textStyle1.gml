/// @function					scr_textStyle1(x,y,text,font,alignment,color);
/// @param {integer}  x			x position of text
/// @param {integer}  y			y position of text
/// @param {string}  text		text to display
/// @param {font}  font			font
/// @param {halign}  alignment  horizontal alignment for font
/// @param {color}  color		font main color
/// @description				write stylized text

function scr_textStyle1(argument0,argument1,argument2,argument3,argument4,argument5){
	draw_set_font(argument3)
	draw_set_halign(argument4)

	draw_set_color(c_black)
	draw_set_alpha(.5)
	draw_text(argument0,argument1+1,argument2)
	
	draw_set_color(argument5)
	draw_set_alpha(1)
	draw_text(argument0,argument1,argument2)
}