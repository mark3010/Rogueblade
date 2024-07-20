/// @description Insert description here
// You can write your code in this editor

if delay1 < 20 && quickVersion == false {
	delay1++
	exit
}


if delay2 == 1 || delay2 == 9 {
	if respawning {
		var test = instance_create_layer(x,y,layer,obj_phase_in)
		test.zPosition = zPosition
		test.bladeCol = bladeCol
		if quickVersion {test.scale = .6}
	}
}

 if quickVersion == false {
	if delay2 < 30 {
		delay2++
		exit
	}
} else {

}
lifetime++

if lifetime == deathTrigger {
	if payload != noone {
		var instance = instance_create_layer(x,y,layer,payload)
		if groupId != -1 {
			instance.groupId = groupId
		}
		instance.zPosition -= 15 * sign(velAdd[Z])
	}

	var ellipse = instance_create_layer(x,y,layer,obj_ellipse_explosion)
	ellipse.zPosition = zPosition+15 * sign(velAdd[Z])
	ellipse.bladeCol = bladeCol
	ellipse.velAdd = velAdd
	if quickVersion {ellipse.scale = .7}
	
	instance_destroy()	
}

image_xscale = lerp(0,1,(lifetime/deathTrigger))
image_yscale = lerp(0,1,(lifetime/deathTrigger))

if lifetime mod (1+round(particlesMod / ((lifetime+1)/deathTrigger))) == 0 {
	//repeat 3 {
		var spawnDir = irandom(359)
		var spawnDistVariance =  - particleDist/4 + irandom(particleDist/4)
		var spawnDist = (particleDist + spawnDistVariance) * (1-quickVersion*.4)
	
		var spawnX = x+lengthdir_x(spawnDist,spawnDir)
		var spawnY = y+lengthdir_y(spawnDist,spawnDir)
	
		var particle = instance_create_layer(spawnX,spawnY,layer,obj_energy_ball_particle)
		particle.direction = point_direction(spawnX,spawnY,x,y)
		particle.zPosition = zPosition
		particle.maxDistance = spawnDist
	//}
}

color = merge_color(color,c_white,.2)