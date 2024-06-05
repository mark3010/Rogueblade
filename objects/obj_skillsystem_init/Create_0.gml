/// @description Insert description here
// You can write your code in this editor
instance_create_layer(x,y,layer,obj_skilltree_generator)
instance_create_layer(x,y,layer,obj_skilltree_upgrade_generator)
var skillSystem = instance_create_depth(x,y,-9999,obj_skilltree_upgrade_tracker)
var skillUi = instance_create_layer(x,y,layer,obj_ui_unselectable_skillpoints)
skillUi.target = skillSystem