/// @description Insert description here
// You can write your code in this editor
if array_length(queue) > 0 {
	//spawn mob
	var spawn = instance_create_depth(xSpawn,ySpawn,depth,obj_spawn_blade)
	spawn.payload = queue[array_length(queue) - 1]
	array_pop(queue)
}