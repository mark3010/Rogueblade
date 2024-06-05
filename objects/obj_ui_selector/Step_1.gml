/// @description Insert description here
// You can write your code in this editor

//SEARCH FOR MENU OPTIONS
//if selected == noone {
//	findStarterMenuOption()
//} else if !instance_exists(selected) {
//	selected = noone
//}

//ACTIVATE MENU OPTION
if keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) {
	if selected != noone {
		selected.click()
	}
}

//HIGHJACK PLAYER CONTROL IF MENU OPTIONS EXIST
//if selected != noone {
	//global.inputHighjack = true
//} else {
//	global.inputHighjack = false
//}

//FIND NEXT MENU OPTION
if keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_up) {
	var dir = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	
	if dir > 0 {
		
	}
	
	if instance_exists(selected) {
		var currentTarget = selected
		var DIST = 1024;    //this is the maximum distance to check
		var d=0;
		var TARG = noone
		with obj_ui_selectable {
		    if sign(y-currentTarget.y) == dir {
		        d = distance_to_object(currentTarget);
		        if d < DIST {
		            DIST = d;
		            TARG = id;
		        }
		    }
		}
		
		if TARG != noone {setSelectedItem(TARG)}
	}
}

