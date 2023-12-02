//DEATH
if currentLife <= 0 {
	ds_map_destroy(cooldownMap)
	instance_destroy()
}

//APPLY MOVEMENT VECTOR
x += vel[@ X]
y += vel[@ Y]