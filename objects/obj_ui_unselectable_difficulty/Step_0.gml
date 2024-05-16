/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(triggerKey) {
	click()
}

var currentSelection = -1// obj_ui_selector.selected
if currentSelection.object_index == obj_ui_selectable_shift {
	text = currentSelection.getDetails()
}

alpha = lerp(alpha,1,global.uiFadeSpeed)