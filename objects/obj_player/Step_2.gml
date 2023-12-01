/// @description Insert description here
// You can write your code in this editor

//DEATH
//death is handled by controller
if currentLife <= 0 {
	obj_controller.endGameFlag = true
}

//APPLY MOVEMENT VECTOR
x += vel[@ X]
y += vel[@ Y]