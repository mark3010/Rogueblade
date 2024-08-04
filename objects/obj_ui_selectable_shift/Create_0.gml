  /// @description Insert description here
// You can write your code in this editor
event_inherited()

shiftLeft = vk_left
shiftRight = vk_right
selected = 0
selection = [0,1,2,3,4,5]

shiftRightAnim = 0
shiftLeftAnim = 0

function getArrayPosition() {
	//wtf does this shit even do
	var i = 0
	var aLen = array_length(selection)
	if selected > 0 {i = selected mod (aLen)}
	else {i = (aLen)-1 - abs(selected-(aLen-1)) mod aLen} 
	
	//show_debug_message("getArrayPos: "+string(i))
	return i
}

function getSelection() {
	var i = selection[getArrayPosition()]

	return i
}

function setSelection(_options) {
	//show_debug_message("selection set: "+string(_options))
	//var i = 0
	selection = _options
	//repeat(_options) {
	//	array_push(selection,i)
	//	i++
	//}
}

function name(partEnum) {
	return "DEFINE IN OBJECT CREATION -> ROOM EDITOR"
	}

function getDetails() {
	return "DEFINE IN OBJECT CREATION -> ROOM EDITOR"
	}

