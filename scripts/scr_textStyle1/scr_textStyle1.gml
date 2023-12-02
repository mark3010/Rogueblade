/// @function					scr_textStyle1(x,y,text,font,alignment,color);
/// @param {integer}  x			x position of text
/// @param {integer}  y			y position of text
/// @param {string}  text		text to display
/// @param {font}  font			font
/// @param {halign}  alignment  horizontal alignment for font
/// @param {hex}  color			font main color
/// @param {int}  alpha			font alpha
/// @param {int}  size			font size
/// @description				write stylized text

function scr_textStyle1(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7){
	draw_set_font(argument3)
	draw_set_halign(argument4)

	draw_set_color(c_black)
	draw_set_alpha(.5*argument6)
	draw_text_transformed(argument0,argument1+1,argument2,argument7,argument7,0)
	
	draw_set_color(argument5)
	draw_set_alpha(argument6)
	draw_text_transformed(argument0,argument1,argument2,argument7,argument7,0)
}