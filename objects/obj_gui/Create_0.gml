bottomMargin = 25
sideMargin = 25
uiAlpha = 1

playerUIAlpha = 0
arenaUIAlpha = 0

overlayFlag = false
overlayAlpha = 0

#region TIMER
timerPosX = sideMargin
timerPosY = 540-bottomMargin
#endregion

#region PLAYER RESOURCES
//life
	playerCurrentLife = 1
	playerMaxLife = 1
	healthPosX = 960/2
	healthPosY = 540-bottomMargin

	healthWidth = 100
	healthHeight = sprite_get_height(spr_health_bar)
	healthAlpha = 1
	healthNumberYOffset = 2
	healthAnimSpeed = .15 // [0..1]
	healthAnim = 0
//triggers
	playerTriggersCooldownScale = 0
	playerMaxTriggers = 0
	playerCurrentTriggers = 0
	playerMaxTriggersCooldown = 1
	playerCurrentTriggersCooldown = 0
	playerLightColor = c_white
	playerEnergyColor = c_white
	triggersCooldownPosX = healthPosX
	triggersCooldownPosY = healthPosY-5

	triggersCooldownWidth = 100
	triggersCooldownHeight = sprite_get_height(spr_triggers_cooldown_bar)
	triggersCooldownAlpha = 1
//indicators
	playerDQSaveCooldown = 0
	playerDQSaveMax = 0
	playerDQSaveCurrent = 0
	playerDQSaveExpended = false
	playerDQSavesPrevious = false
	playerIsAttacking = 0
	playerAttackScale = 0
	playerIsDashing = 0
	playerDQSavesPrevious = 1
	
#endregion

#region WAVELIST
waveListPosX = 960-sideMargin
waveListPosY = 540-bottomMargin
waveTimerWidth = 50
waveTimerHeight = sprite_get_height(spr_wave_timer_bar)
#endregion

#region EXP
playerXPScale = 1
playerLevel = "LEVEL: -"
playerLevelPop = 0
playerLevelAnim = 1
expWidth = 60
expHeight = sprite_get_height(spr_exp_bar)
playerXPScale = 0
playerLevelPop = 0
playerLevelAnim = 0

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