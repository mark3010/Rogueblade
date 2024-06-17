/// @description Insert description here
// You can write your code in this editor
lifetime++

if lifetime == deathTrigger {
	if payload != noone {
		var instance = instance_create_layer(x,y,layer,payload)
		if groupId != -1 {
			instance.groupId = groupId
		}
	}
	instance_destroy()	
}

if animation > .7 {
	color = merge_color(color,c_black,.2)
	alpha = lerp(alpha,0,.2)
}

animation = lerp(animation,1,.1)
