/// @description Insert description here
// You can write your code in this editor
menuPath = []
currentPage = -1
function pageMemory(_layerPage,_optionId) 
constructor {
	page = _layerPage
	option = _optionId
}

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

function goToPage(_layerName) {
	array_push(menuPath,[currentPage,selected])
	currentPage = _layerName
	
	obj_menu_page_handler.goTo(_layerName)
	
	findStarterMenuOption()
	
	show_debug_message(menuPath)
}

function goBack() {
	var lastPage = menuPath[array_length(menuPath)-1]
	obj_menu_page_handler.goTo(lastPage[0])
	currentPage = lastPage[0]
	selected = lastPage[1]
	array_pop(menuPath)
	show_debug_message(menuPath)
}

function setBasePage(_layerName) {
	currentPage = _layerName
	findStarterMenuOption()
	show_debug_message(menuPath)
}

function forget() {
	menuPath = []
	selected = noone
	show_debug_message(menuPath)
}