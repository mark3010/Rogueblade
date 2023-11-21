//DEATH
if currentLife <= 0 {
	instance_destroy()
}

//APPLY MOVEMENT VECTOR
x += vel[@ X]
y += vel[@ Y]