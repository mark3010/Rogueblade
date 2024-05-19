/// @description Insert description here
// You can write your code in this editor
event_inherited()

function pop() {
	popAnimation = 0
	obj_skilltree_generator.refocus(structName)
}

function click() {
	var _me = variable_struct_get(obj_skilltree_generator.skillTree,structName)
	variable_struct_set(_me,"level",1)
	
	obj_skilltree_upgrade_generator.updateSelection()
	
	//update player
	instance_activate_object(obj_player)
	obj_player.updateStats(_me.stats,"add")
	instance_deactivate_object(obj_player)
}