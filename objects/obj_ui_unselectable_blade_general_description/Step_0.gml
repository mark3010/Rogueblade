/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(triggerKey) {
	click()
}

statsheet = obj_player.stats
core = obj_player.core
hull = obj_player.hull
anchor = obj_player.anchor

alpha = lerp(alpha,1,global.uiFadeSpeed)