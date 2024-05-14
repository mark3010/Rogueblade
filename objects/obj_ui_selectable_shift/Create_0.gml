/// @description Insert description here
// You can write your code in this editor
event_inherited()

shiftLeft = vk_left
shiftRight = vk_right
selected = 0
selection = [0,1,2,3,4,5]

function getSelection() {
	var i = 0
	var aLen = array_length(selection)
	if selected > 0 {i = selected mod (aLen)}
	else {i = (aLen)-1 - abs(selected-(aLen-1)) mod aLen} 

	return i
}

function setSelection(_options) {
	var i = 0
	selection = []
	repeat(_options) {
		array_push(selection,i)
		i++
	}
}