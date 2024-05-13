/// @description Insert description here
// You can write your code in this editor
event_inherited()

selected = noone
global.inputHighjack = false

function findStarterMenuOption() {
	var topButton = noone
	for (var i = 0; i < instance_number(obj_ui_selectable); ++i;){
		var _current_instance = instance_find(obj_ui_selectable,i);
	    //button_list[i] = _current_instance
	
		// find start selection (highest button)
		if topButton == noone {
			topButton = _current_instance
		} else if topButton.y>_current_instance.y {
			topButton = _current_instance	
		}
	}

	selected = topButton
}