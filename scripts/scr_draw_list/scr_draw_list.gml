// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_list(argument0,argument1=false){
	//
	var draw_list = argument0
	var line = 0
	var lineDist = 16
	var descriptionWidth = 220
	
	var drawBackdrop = argument1
	var boxLength = 0
	if drawBackdrop {
		//calculate length
		for (var i = 0; i< array_length(draw_list);i++) {
			draw_set_halign(fa_left)
			draw_set_font(font_opensans)
			boxLength += lineDist
			
			var descItems = draw_list[i].body
	        for (j = 0; j < array_length(descItems); j ++) {
				boxLength += string_height_ext(descItems[j].text,lineDist,descriptionWidth)
	        }
			
			//boxLength += string_height_ext(draw_list[i].body,lineDist,descriptionWidth)
			boxLength += lineDist
		}
		//draw backdrop
		var boxX = x-descriptionWidth/2-16
		var boxY = y-16*3
		var boxWidth = descriptionWidth+16*2
		var boxHeight = boxLength +16*3
		
		draw_sprite_stretched(spr_black,0,boxX,boxY,boxWidth,boxHeight)
	}
	
	for (var i = 0; i< array_length(draw_list);i++) {
		
		if variable_instance_exists(draw_list[i],"title") {
			var strWidth = string_width(draw_list[i].title)
			var lineStartX = strWidth/2+12
			//var titleStartY = line
	
			//title
			draw_set_halign(fa_center)
		
			draw_set_font(font_opensans)
		
			draw_set_color(c_black)
			draw_text_ext(x,y+line-6+1,draw_list[i].title,lineDist,descriptionWidth)
			draw_line_width(x+lineStartX,y+line+1,x+descriptionWidth/2,y+line+1,1)
			draw_line_width(x-lineStartX,y+line+1,x-descriptionWidth/2,y+line+1,1)
		
			draw_set_color(color)
			draw_text_ext(x,y+line-6,draw_list[i].title,lineDist,descriptionWidth)
			draw_set_color(global.txtColDark)
			draw_line_width(x+lineStartX,y+line,x+descriptionWidth/2,y+line,1)
			draw_line_width(x-lineStartX,y+line,x-descriptionWidth/2,y+line,1)
			line += lineDist //newline
		}
		//text body
		//var descriptionStartY = line //strHeight/2+2 + 
		draw_set_halign(fa_left)
		draw_set_color(descriptionColor)
		draw_set_font(font_opensans)
		
		var descItems = draw_list[i].body
		//show_debug_message("arraylength "+string(array_length(descItems)))
        for (j = 0; j < array_length(descItems); j ++) {
			
			draw_set_color(c_black)
			draw_text_ext(x-descriptionWidth/2,y+line+1,descItems[j].text,lineDist,descriptionWidth)
			draw_set_color(descItems[j].color)
			draw_text_ext(x-descriptionWidth/2,y+line,descItems[j].text,lineDist,descriptionWidth)
			line += string_height_ext(descItems[j].text,lineDist,descriptionWidth)
			
        }
		line += lineDist
		
		//draw_text_ext(x-descriptionWidth/2,y+descriptionStartY,draw_list[i].body,lineDist,descriptionWidth)
		//line += string_height_ext(draw_list[i].body,lineDist,descriptionWidth)
		//line += lineDist
	}
}