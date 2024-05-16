/// @description Insert description here
// You can write your code in this editor

var line = 0
var lineDist = 16

//TITLE
var strWidth = string_width("Blade build")
var strHeight = string_height("Blade build")
var lineStartX = strWidth/2+12
var lineStartY = strHeight/2+2 + line
var descriptionWidth = 220
scr_textStyle1(x,y+lineStartY-6,"Blade build",font,align,color,alpha,size)
draw_line(x+lineStartX,y+lineStartY,x+descriptionWidth/2,y+lineStartY)
draw_line(x-lineStartX,y+lineStartY,x-descriptionWidth/2,y+lineStartY)

line += lineDist //newline
	
//DESCRIPTION
var descText = string(core.name) + " | " + string(hull.name) + " | " + string(anchor.name)
var descriptionStartY = strHeight/2+2 + lineDist
	
//model and manifacturer
/*
draw_set_halign(fa_left)
draw_set_color(c_grey)
draw_set_font(font_silkscreen)
draw_text_ext(x-descriptionWidth/2,y+descriptionStartY,"model: "+string(text.model),lineDist,descriptionWidth)
	
draw_set_halign(fa_right)
draw_text_ext(x+descriptionWidth/2,y+descriptionStartY,string(text.manifacturer)+" -",lineDist,descriptionWidth)

descriptionStartY+=lineDist
line+= 12*/

//text body
draw_set_halign(fa_center)
draw_set_color(descriptionColor)
draw_set_font(font_opensans)
draw_text_ext(x,y+descriptionStartY,descText,lineDist,descriptionWidth)

line += string_height_ext(descText,lineDist,descriptionWidth) //12 is model and manifacturer width

//TITLE
lineStartY+= line + 8//
scr_textStyle1(x,y+lineStartY-6,"Summary",font,align,color,alpha,size)
draw_line(x+lineStartX,y+lineStartY,x+descriptionWidth/2,y+lineStartY)
draw_line(x-lineStartX,y+lineStartY,x-descriptionWidth/2,y+lineStartY)

line += lineDist //newline
	
//DESCRIPTION
var descText = ""

descText += "Maximum health: " + string(statsheet.maxLife) + "\n"
descText += "Maximum triggershields: " + string(statsheet.maxTriggers) + "\n"
descText += "Triggershield cooldown: " + string(statsheet.maxTriggersCooldown/60) + " s. \n"


var descriptionStartY = strHeight/2+2 + line +6
	
//text body
draw_set_halign(fa_left)
draw_set_color(descriptionColor)
draw_set_font(font_opensans)
draw_text_ext(x-descriptionWidth/2,y+descriptionStartY,descText,lineDist,descriptionWidth)

line += string_height_ext(descText,lineDist,descriptionWidth) //12 is model and manifacturer width

