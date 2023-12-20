/// @description Insert description here
// You can write your code in this editor
lifetime++

if lifetime == deathTrigger {
	if payload != noone {
		instance_create_depth(x,y,depth,payload)
	}
	instance_destroy()	
}