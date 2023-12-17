//DEATH
if currentLife <= 0 {
	if team = TEAM.ENEMY && instance_exists(obj_player) {
		obj_player.EXP++
	}
	ds_map_destroy(cooldownMap)
	instance_destroy()
}

//APPLY MOVEMENT VECTOR
x += vel[@ X]
y += vel[@ Y]