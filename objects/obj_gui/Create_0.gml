
#region TIMER
timerPosX = 30
timerPosY = 540-30
#endregion

#region PLAYER RESOURCES
//life
	healthPosX = 960/2
	healthPosY = 540-30

	healthWidth = 100
	healthHeight = sprite_get_height(spr_health_bar)
	healthAlpha = 1
	healthNumberYOffset = 0
	healthAnimSpeed = .1 // [0..1]
	healthAnim = 0
//triggers
	triggersCooldownPosX = healthPosX
	triggersCooldownPosY = healthPosY-10

	triggersCooldownWidth = 100
	triggersCooldownHeight = sprite_get_height(spr_triggers_cooldown_bar)
	triggersCooldownAlpha = 1
#endregion

#region WAVELIST
waveListPosX = 960-30
waveListPosY = 540-30
#endregion

#region EXP
expWidth = 120
expHeight = sprite_get_height(spr_exp_bar)

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
	expSurf = surface_create(expWidth,expHeight)
	triggersCooldownSurf = surface_create(triggersCooldownWidth,triggersCooldownHeight)
#endregion