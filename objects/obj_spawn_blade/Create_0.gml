event_inherited()
image_speed = .1
//customize
deathTrigger = 90 // in frames
size = 20 //in pixels
color = c_white
centerDist = 0
groupId = -1

animationScale = 3
animationScaleSpeed = .05
//CORRECT POSITION TO INSIDE ARENA
scr_bladeArenaSync()

if (x > arenaSlopedBorderX || x < arenaSlopedBorderX) {
	x = arenaSlopedBorderX
}

if (y > arenaSlopedBorderY || y < arenaSlopedBorderY) {
	y = arenaSlopedBorderY
}

function draw_me(sliceSurf, effectSurf, targetSurf) {

	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_spawn_warning,image_index,x,y,animationScale,animationScale,0,c_white,3-animationScale)
	draw_sprite_ext(spr_spawn_warning_frame,image_index,x,y,power(animationScale,1.5),power(animationScale,1.5),0,c_white,3-animationScale)
	gpu_set_blendmode(bm_normal)
}