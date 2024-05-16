/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_ui_selector) {
	if obj_ui_selector.selected == id {
		isSelected = true
	} else {
		isSelected = false
	}
}

if keyboard_check_pressed(triggerKey) {
	click()
}

alpha = lerp(alpha,1,global.uiFadeSpeed)

popAnimation = lerp(popAnimation,1,.2)
popMod = 1 + (1-popAnimation) * .1