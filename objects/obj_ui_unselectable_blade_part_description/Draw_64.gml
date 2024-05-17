/// @description Insert description here
// You can write your code in this editor



if text.type == "CORE" {
	var draw_list = [	{title : "On trigger",body : string(text.behavior)},
						{title : "Targeting",body : string(text.targeting)},
						{title : "Modifiers",body : string(obj_text_formatter.formatStats(text.stats))}]
	
	scr_draw_list(draw_list,true)
}