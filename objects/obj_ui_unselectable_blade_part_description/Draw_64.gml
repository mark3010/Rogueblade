/// @description Insert description here
// You can write your code in this editor

var line = 0
var lineDist = 16

//TITLE
var strWidth = string_width("Description")
var strHeight = string_height("Description")
var lineStartX = strWidth/2+12
var lineStartY = strHeight/2+2 + line
var descriptionWidth = 220
scr_textStyle1(x,y+lineStartY-6,"Description",font,align,color,alpha,size)
draw_line(x+lineStartX,y+lineStartY,x+descriptionWidth/2,y+lineStartY)
draw_line(x-lineStartX,y+lineStartY,x-descriptionWidth/2,y+lineStartY)

line += 8 //newline
	
//DESCRIPTION
var descText = text.description
var descriptionStartY = strHeight/2+2 + line
	
//model and manifacturer
draw_set_halign(fa_left)
draw_set_color(c_grey)
draw_set_font(font_silkscreen)
draw_text_ext(x-descriptionWidth/2,y+descriptionStartY,"model: "+string(text.model),lineDist,descriptionWidth)
	
draw_set_halign(fa_right)
draw_text_ext(x+descriptionWidth/2,y+descriptionStartY,string(text.manifacturer)+" -",lineDist,descriptionWidth)

descriptionStartY+=lineDist
line += lineDist 

//text body
draw_set_halign(fa_left)
draw_set_color(descriptionColor)
draw_set_font(font_opensans)
draw_text_ext(x-descriptionWidth/2,y+descriptionStartY,descText,lineDist,descriptionWidth)

line += string_height_ext(descText,lineDist,descriptionWidth) //12 is model and manifacturer width

//TITLE
lineStartY+= line + 8//
scr_textStyle1(x,y+lineStartY-6,"Modifiers",font,align,color,alpha,size)
draw_line(x+lineStartX,y+lineStartY,x+descriptionWidth/2,y+lineStartY)
draw_line(x-lineStartX,y+lineStartY,x-descriptionWidth/2,y+lineStartY)

line += lineDist //newline
	
//DESCRIPTION
var descText = obj_text_formatter.formatStats(text.stats)
var descriptionStartY = strHeight/2+2 + line +6
	
//text body
draw_set_halign(fa_left)
draw_set_color(descriptionColor)
draw_set_font(font_opensans)
draw_text_ext(x-descriptionWidth/2,y+descriptionStartY,descText,lineDist,descriptionWidth)

line += string_height_ext(descText,lineDist,descriptionWidth) //12 is model and manifacturer width

