//run parent code
event_inherited()



//MOVEMENT
move_up    = keyboard_check(global.key_up)
move_down  = keyboard_check(global.key_down)
move_left  = keyboard_check(global.key_left)
move_right = keyboard_check(global.key_right)

var dirX, dirY, dir

dirX = 0
dirY = 0

if (move_right || move_left) {
	dirX = move_right-move_left
}
if (move_up || move_down) {
	dirY = move_down-move_up
}

dir = point_direction(0,0,dirX,dirY)

if (move_right || move_left) {
		vel[@ X] += lengthdir_x(stats.acc,dir)
}

if (move_up || move_down) {
		vel[@ Y] += lengthdir_y(stats.acc,dir)
}

//LEVEL UP
if EXP >= EXPCapList[level-1] {
	obj_upgrade_handler.getUpgrade(self)
	
	//refresh player
	EXP -= EXPCapList[level-1]
	level++
	currentLife = stats.maxLife
	
	//effects
	var levelUpEffect = instance_create_depth(x,y,depth,obj_level_up)
	levelUpEffect.target = id
	
	audio_play_sound(snd_level_up, 2, false);
}

