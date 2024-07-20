/// @description Insert description here
// You can write your code in this editor


//DESCRIPTION
if structName != noone && instance_exists(obj_skilltree_generator) {
	var skillStats = variable_struct_get(obj_skilltree_generator.skillTree,structName).stats

	var draw_list = [{title:"Stats added", body : obj_text_formatter.formatStats(skillStats)}]

	scr_draw_list(draw_list)
}