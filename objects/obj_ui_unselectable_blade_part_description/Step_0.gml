/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(triggerKey) {
	click()
}

var currentSelection = obj_ui_selector.selected
if currentSelection.object_index == obj_ui_selectable_shift {
	part = currentSelection.getDetails()
	//show_debug_message(part)
}

alpha = lerp(alpha,1,global.uiFadeSpeed)