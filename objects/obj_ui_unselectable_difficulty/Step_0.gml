/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(triggerKey) {
	click()
}

var currentSelection = obj_ui_selector.selected

if instance_exists(obj_ui_selectable_shift) {currentSelection = obj_ui_selectable_shift}

if currentSelection.object_index == obj_ui_selectable_shift {
	var currentDiffList = []
	var allDiffList = obj_file_handler.getAllDifficulties()
	var textConversion = {title: "Ascension modifiers", body: []}
	
	if (currentSelection.getSelection()) > 0 {
		array_push(textConversion.body,{
			text: ("Increased score bonus: "+string(currentSelection.getSelection()*10) + "%"),
			color: global.txtColPositive})
	}
	
	for (var i = 0; i < currentSelection.getSelection();i++) {
		array_push(textConversion.body,{
			text: allDiffList[i].description,
			color: global.txtColNegative})
	}
	difficultyList = [textConversion]
	//text = currentSelection.getDetails()
}

alpha = lerp(alpha,1,global.uiFadeSpeed)