/// @description Insert description here
// You can write your code in this editor
if !instance_exists(target) {
	instance_destroy()
}

lifetime++

if lifetime == deathTrigger {
	if payload != noone {
		var instance = instance_create_layer(x,y,layer,payload)
		if groupId != -1 {
			instance.groupId = groupId
		}
		
		//if instance has spawn animation
		try {
			instance.spawn(false,instance.generateSpawnVelocity(),120)
		} catch(e) {
		//do nothing
		}
	}
	instance_destroy()	
}