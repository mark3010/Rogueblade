/// @description Insert description here
// You can write your code in this editor
chilling = false
if instance_exists(obj_player) && global.inputHighjack {
	if obj_player.velVector > .6 {
		obj_player.vel[X] = obj_player.vel[X] *.985
		obj_player.vel[Y] = obj_player.vel[Y] *.985
		chilling = true
	}
}

