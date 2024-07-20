/// @description Insert description here
// You can write your code in this editor

if lifetime == deathTrigger-1 {
	var levelUpText = instance_create_layer(x,y,layer,obj_level_up_text)
	levelUpText.zPosition = zPosition - 16
	levelUpText.energyColor = energyColor
	levelUpText.target = obj_player
}

event_inherited()

x = target.x
y = target.y
zPosition = target.zPosition

if deathTrigger mod lifetime == 0 || lifetime mod 8 == 0 {
	var levelUpParticles = instance_create_layer(x,y,layer,obj_levelspark_2)
	levelUpParticles.zPosition = zPosition + 0
	levelUpParticles.energyColor = energyColor
	levelUpParticles.xOffset += 10 -irandom(20)
}