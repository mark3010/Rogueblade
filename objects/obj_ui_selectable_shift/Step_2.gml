/// @description Insert description here
// You can write your code in this editor


if isSelected {
	var left = keyboard_check_pressed(shiftLeft)
	var right = keyboard_check_pressed(shiftRight)
	
	if left || right {
		var iterate = right - left
	
		selected += iterate
		
		if iterate != 0 {
			click()
		}
	}
}