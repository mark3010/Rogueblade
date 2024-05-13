global.guiTestEnable = false
bottomMargin = 25
sideMargin = 25
#region TIMER
timerPosX = sideMargin
timerPosY = 540-bottomMargin
#endregion

#region PLAYER RESOURCES
//life
	healthPosX = 960/2
	healthPosY = 540-bottomMargin

	healthWidth = 100
	healthHeight = sprite_get_height(spr_health_bar)
	healthAlpha = 1
	healthNumberYOffset = 2
	healthAnimSpeed = .05 // [0..1]
	healthAnim = 0
//triggers
	triggersCooldownPosX = healthPosX
	triggersCooldownPosY = healthPosY-5

	triggersCooldownWidth = 100
	triggersCooldownHeight = sprite_get_height(spr_triggers_cooldown_bar)
	triggersCooldownAlpha = 1
//indicators
	playerIsAttacking = 0
	playerIsDashing = 0
#endregion

#region WAVELIST
waveListPosX = 960-sideMargin
waveListPosY = 540-bottomMargin
waveTimerWidth = 50
waveTimerHeight = sprite_get_height(spr_wave_timer_bar)
#endregion

#region EXP
expWidth = 60
expHeight = sprite_get_height(spr_exp_bar)
playerXPScale = 0

currentUpgradeTimerMax = 4*60
currentUpgradeTimer = currentUpgradeTimerMax
currentUpgradeText = "none"

#endregion

#region UPGRADE DISPLAY

function updateUpgradeDisplay(text) {
	currentUpgradeText = text
	currentUpgradeTimer = 0
}

#endregion

#region SURFACES
	healthSurf = surface_create(healthWidth * 2 + sprite_get_width(spr_health_bar) * 4,healthHeight)
	healthFillSurf = surface_create(healthWidth * 2 + sprite_get_width(spr_health_bar) * 4,healthHeight)
	expSurf = surface_create(expWidth,expHeight)
	triggersCooldownSurf = surface_create(triggersCooldownWidth,triggersCooldownHeight)
	waveTimerSurf = surface_create(waveTimerWidth,waveTimerHeight);

#endregion