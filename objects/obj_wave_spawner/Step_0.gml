/// @description Insert description here
// You can write your code in this editor
if array_length(queue) > 0 && delay < 0{
	delay = spawnDelay
	var randomX = x+irandom(sprite_get_height(sprite_index)*image_xscale)
	var randomY = y+irandom(sprite_get_height(sprite_index)*image_yscale)
	//spawn mob
	var spawn = instance_create_layer(randomX,randomY,layer,obj_spawn_blade)
	spawn.groupId = obj_wave_director.waveNumber
	spawn.payload = queue[array_length(queue) - 1]
	array_pop(queue)
}

delay--