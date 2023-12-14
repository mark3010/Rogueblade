event_inherited()

//ANIMATION VARIABLES
//TIMER
timerPosX = 30
timerPosY = 540-30

//PLAYER HEALTHBAR
healthPosX = 960/2
healthPosY = 540-30

healthWidth = 100
healthHeight = sprite_get_height(spr_healthbar)
healthAlpha = 1
healthNumberYOffset = 0
healthAnimSpeed = .1 // [0..1]

//WAVELIST
waveListPosX = 960-30
waveListPosY = 540-30

//dont change
healthAnim = 0
healthSurf = surface_create(healthWidth * 2 + sprite_get_width(spr_healthbar) * 4,healthHeight)