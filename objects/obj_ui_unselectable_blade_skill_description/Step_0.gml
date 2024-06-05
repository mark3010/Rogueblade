/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(triggerKey) {
	click()
}

if instance_exists(obj_ui_selector.selected) {
	structName = obj_ui_selector.selected.structName
}

alpha = lerp(alpha,1,global.uiFadeSpeed)