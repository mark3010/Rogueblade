/// @description Insert description here
// You can write your code in this editor
event_inherited()

if instance_exists(obj_cam) {
	xDisplace = x - (x-obj_cam.x) * 1.1
	yDisplace = y - (y-obj_cam.y) * 1.1 - 200
}