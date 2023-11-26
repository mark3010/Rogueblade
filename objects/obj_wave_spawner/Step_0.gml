/// @description Insert description here
// You can write your code in this editor
if array_length(queue) > 0 {
	//position to spawn
	switch (spawnerType) {
		case waveSpawnerType.VERTICAL:
		
			var spawnerLength = sprite_get_height(sprite_index) * image_yscale
			
			var xSpawn = x + sprite_get_width(sprite_index) / 2
			var ySpawn = y + irandom(spawnerLength) - spawnerLength / 2
			
		break
		case waveSpawnerType.HORIZONTAL:
		
			var spawnerLength = sprite_get_width(sprite_index) * image_xscale
			
			var xSpawn = x + irandom(spawnerLength) - spawnerLength / 2
			var ySpawn = y + sprite_get_height(sprite_index) / 2 
			
		break
	}
	
	//spawn mob
	instance_create_depth(xSpawn,ySpawn,depth,queue[array_length(queue) - 1])
	array_pop(queue)
}