/// @description Insert description here
// You can write your code in this editor


if isSelected {
	var left = keyboard_check_pressed(shiftLeft)
	var right = keyboard_check_pressed(shiftRight)
	
	if left || right {
		var iterate = right - left
	
		selected += iterate
		
		if iterate > 0 {
			shiftRightAnim = 1
		}
		if iterate < 0 {
			shiftLeftAnim = 1
		}
		if iterate != 0 {
			click()
			pop()
		}
	}
}

shiftRightAnim = lerp(shiftRightAnim,0,.2)
shiftLeftAnim = lerp(shiftLeftAnim,0,.2)