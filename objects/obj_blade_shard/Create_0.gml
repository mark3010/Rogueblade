/// @description Insert description here
// You can write your code in this editor
event_inherited()
deathTrigger = 16
xScaleSpeed = irandom(100)-50
yScaleSpeed = irandom(100)-50
rotationSpeed = irandom(100)-50
image_speed = 0
direction = irandom(359)
image_angle = irandom(359)
speed = 1+irandom(100)/12.5
imagenumber = irandom(10)

function draw_me(sliceSurf, effectSurf, targetSurf) {
	draw_sprite_ext(sprite_index,imagenumber,x,y-12,image_xscale,image_yscale,image_angle,c_white,image_alpha)
}
