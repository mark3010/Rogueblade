/// @description Insert description here
// You can write your code in this editor
lifetime++

if lifetime == deathTrigger {
	if payload != noone {
		instance_create_layer(x,y,layer,payload)
	}
	instance_destroy()	
}