//DEATH
if currentLife <= 0 {
	die()
}

//APPLY MOVEMENT VECTOR
x += vel[@ X]
y += vel[@ Y]