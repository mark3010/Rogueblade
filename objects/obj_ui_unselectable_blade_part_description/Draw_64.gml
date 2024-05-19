/// @description Insert description here
// You can write your code in this editor



if part.type == "CORE" {
	var draw_list = [	{title : "On trigger",body : [{text : string(part.behavior), color: descriptionColor}]},
						{title : "Targeting", body : [{text : string(part.targeting), color: descriptionColor}]},
						{title : "Modifiers", body : obj_text_formatter.formatStats(part.stats)}]
	
} else if part.type == "HULL" {
	var draw_list = [{title : "Modifiers", body : obj_text_formatter.formatStats(part.stats)}]

} else if part.type == "ANCHOR" {
	var draw_list = [{title : "Modifiers", body : obj_text_formatter.formatStats(part.stats)}]

}
scr_draw_list(draw_list,true)