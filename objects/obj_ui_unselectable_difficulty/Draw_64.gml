/// @description Insert description here
// You can write your code in this editor

var line = 0
var lineDist = 16

//TITLE
var strWidth = string_width("Modifier list")
var strHeight = string_height("Modifier list")
var lineStartX = strWidth/2+12
var lineStartY = strHeight/2+2 + line
var descriptionWidth = 220
scr_textStyle1(x,y+lineStartY-6,"Modifier list",font,align,color,alpha,size)
draw_line(x+lineStartX,y+lineStartY,x+descriptionWidth/2,y+lineStartY)
draw_line(x-lineStartX,y+lineStartY,x-descriptionWidth/2,y+lineStartY)

line += lineDist //newline
	
//DESCRIPTION
var descText = "havent made this feature yet lule :^)"
var descriptionStartY = strHeight/2+2 + lineDist
	
//text body
draw_set_halign(fa_left)
draw_set_color(descriptionColor)
draw_set_font(font_opensans)
draw_text_ext(x-descriptionWidth/2,y+descriptionStartY,descText,lineDist,descriptionWidth)

line += string_height_ext(descText,lineDist,descriptionWidth) //12 is model and manifacturer width
