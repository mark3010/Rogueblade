/// @description Insert description here
// You can write your code in this editor


//DESCRIPTION
var summaryStats = {}
summaryStats = scr_structs_merge(variable_clone(core.stats),variable_clone(hull.stats))
summaryStats = scr_structs_merge(summaryStats,variable_clone(anchor.stats))

var draw_list = [
	{title:"Blade build", body : [ 
		{text : (string(core.name) + " | " + string(hull.name) + " | " + string(anchor.name)),
		color : descriptionColor}
		]},
	{title: "Summary",body : obj_text_formatter.formatStats(summaryStats)}
	]

scr_draw_list(draw_list)