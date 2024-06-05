/// @description Insert description here
// You can write your code in this editor
global.uiFadeSpeed = .3
menuPath = []
currentPage = -1
function pageMemory(_layerPage,_optionId) 
constructor {
	page = _layerPage
	option = _optionId
}

event_inherited()

selected = noone
global.inputHighjack = true

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

	setSelectedItem(topButton)
}

function goToPage(_layerName) {
	array_push(menuPath,[currentPage,selected])
	currentPage = _layerName
	
	obj_menu_page_handler.goTo(_layerName)
	
	findStarterMenuOption()
	
}

function goBack() {
	var lastPage = menuPath[array_length(menuPath)-1]
	obj_menu_page_handler.goTo(lastPage[0])
	currentPage = lastPage[0]
	setSelectedItem(lastPage[1])
	array_pop(menuPath)
}

function setBasePage(_layerName) {
	currentPage = _layerName
	findStarterMenuOption()
}

function forget() {
	menuPath = []
	setSelectedItem(noone)
}

function setSelectedItem(selectedId) {
	selected = selectedId
	if instance_exists(selected) {selected.pop()}
}