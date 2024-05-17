/// @description Insert description here
// You can write your code in this editor


//DESCRIPTION
var summaryText = ""

summaryText += "Maximum health: " + string(statsheet.maxLife) + "\n"
summaryText += "Maximum triggershields: " + string(statsheet.maxTriggers) + "\n"
summaryText += "Triggershield cooldown: " + string(statsheet.maxTriggersCooldown/60) + " s. \n"

var draw_list = [
	{title:"Blade build", body : string(core.name) + " | " + string(hull.name) + " | " + string(anchor.name)},
	{title: "Summary",body : summaryText}
	]

scr_draw_list(draw_list)

