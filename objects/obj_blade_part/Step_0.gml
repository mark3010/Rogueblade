/// @description Insert description here
// You can write your code in this editor
animationsCalculate()
velocity = point_distance(x,y,x+vel[X],y+vel[Y])
zRot += zRotSpeed
//z axis
if zPosition <= 0 && vel[Z] < -1 {	//bounce on ground
	vel[Z] = -vel[Z] * stats.zBounciness / 100
}

if zPosition <= 0 && vel[Z] > -1 && vel[Z] < 0 {	//cut bounce
	vel[Z] = 0
	zPosition = 0
}

if zPosition > 0 {					//apply gravity
	vel[Z] -= (stats.zGravity / 60)
}

lifeTime++

if lifeTime >= deathTrigger {
	image_alpha -= .05
}

if image_alpha <= 0 {
	instance_destroy()
}