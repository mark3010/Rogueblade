/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_cam) {obj_cam.screenshake(12,6,0.5)} // shake screen
if instance_exists(obj_atmosphere) {obj_atmosphere.switchThemeLerp(c_dkgray,0.05)}
obj_gameinit.endGame()