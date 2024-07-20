queue = []
spawnDelay = 12
delay = 0

function updateSpawner() {
	//position to spawn
	switch (spawnerType) {
		case waveSpawnerType.VERTICAL:
			spawnerLength = sprite_get_height(sprite_index) * image_yscale
			xSpawn = x + sprite_get_width(sprite_index) / 2
			ySpawn = y + irandom(spawnerLength) - spawnerLength / 2
		break
		case waveSpawnerType.HORIZONTAL:
			spawnerLength = sprite_get_width(sprite_index) * image_xscale
			xSpawn = x + irandom(spawnerLength) - spawnerLength / 2
			ySpawn = y + sprite_get_height(sprite_index) / 2 
		break
	}
}