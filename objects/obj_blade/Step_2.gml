if deathFlag {
	ds_map_destroy(cooldownMap)
	instance_destroy()
}

//APPLY MOVEMENT VECTOR
x += vel[@ X]
y += vel[@ Y]
zPosition += vel[@ Z]
if zPosition < 0 {
	zPosition = 0
}