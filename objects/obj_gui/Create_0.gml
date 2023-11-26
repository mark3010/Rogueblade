/// @description Insert description here
// You can write your code in this editor

//COMPONENTS
timer = instance_create_depth(x,y,depth,obj_timer)

//ANIMATION VARIABLES
//TIMER
timerPosX = 30
timerPosY = obj_cam.camHeight-30

//PLAYER HEALTHBAR
healthPosX = obj_cam.camWidth/2
healthPosY = obj_cam.camHeight-30

healthWidth = 100
healthHeight = sprite_get_height(spr_healthbar)
healthAlpha = 1
healthNumberYOffset = 0; // 0 or -18
healthAnimSpeed = .1 // [0..1]

//WAVELIST
waveListPosX = obj_cam.camWidth-30
waveListPosY = obj_cam.camHeight-30

//dont change
healthAnim = 0
healthSurf = surface_create(healthWidth * 2 + sprite_get_width(spr_healthbar) * 4,healthHeight)