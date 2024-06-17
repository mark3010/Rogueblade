/// @description Insert description here
// You can write your code in this editor


if lifetime == 0 ||lifetime == 9 {
		var particle = instance_create_layer(x,y,layer,obj_phase_out)
		//particle.direction = direction - variance/4*2
		particle.zPosition = zPosition
		particle.bladeCol = bladeCol
		//show_debug_message(lifetime)
}

lifetime++

//image_xscale = lerp(0,1,(lifetime/deathTrigger))
//image_yscale = lerp(0,1,(lifetime/deathTrigger))

if lifetime mod particlesMod == 0 {
	//repeat 3 {
		
		//var spawnDistVariance =  - particleDist/4 + irandom(particleDist/4)
		//var spawnDist = particleDist + spawnDistVariance
		var variance = irandom(width) - width/2
		var spawnX = x + variance
		var spawnY = y//+lengthdir_y(spawnDist,spawnDir)
	
		var particle = instance_create_layer(spawnX,spawnY,layer,obj_dqspark)
		particle.direction = direction - variance/4*2
		particle.zPosition = zPosition - variance/4
		particle.energyColor = bladeCol
	//}
}



color = merge_color(color,c_white,.2)

if lifetime == deathTrigger {
	if payload != noone {
		var instance = instance_create_layer(x,y,layer,payload)
		if groupId != -1 {
			instance.groupId = groupId
		}
	}
	/*
	var randomDir = irandom(359)
	var spinParticle1 = instance_create_layer(x,y,layer,obj_spiral_spark)
	spinParticle1.direction = randomDir
	spinParticle1.zPosition = zPosition
	spinParticle1.energyColor = bladeCol
	var spinParticle2 = instance_create_layer(x,y,layer,obj_spiral_spark)
	spinParticle2.direction = randomDir + 180
	spinParticle2.zPosition = zPosition
	spinParticle2.energyColor = bladeCol*/
	
	instance_destroy()	
}