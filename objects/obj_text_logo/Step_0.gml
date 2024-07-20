/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(triggerKey) {
	click()
}

delay--

if delay <= 0 {
	alpha = lerp(alpha,1,0.05)
}