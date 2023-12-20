event_inherited()

//customize
deathTrigger = 90 // in frames
size = 20 //in pixels
color = c_white
centerDist = 0

//CORRECT POSITION TO INSIDE ARENA
scr_bladeArenaSync()

if (x > arenaSlopedBorderX || x < arenaSlopedBorderX) {
	x = arenaSlopedBorderX
}

if (y > arenaSlopedBorderY || y < arenaSlopedBorderY) {
	y = arenaSlopedBorderY
}