/// @description Insert description here
// You can write your code in this editor

currentUpgradeTimer+=1

if instance_exists(obj_game_end_darkOverlay) {
	overlayAlpha = obj_game_end_darkOverlay.overlayAlpha
} else {
	overlayAlpha = 0
}