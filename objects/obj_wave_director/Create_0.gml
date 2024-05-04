#region ENUMS
enum waveType {
	ALL,
	HORIZONTAL,
	VERTICAL,
	TOP,
	BOT,
	LEFT,
	RIGHT,
	total
}

enum waveSpawnerType {
	HORIZONTAL,
	VERTICAL
}
#endregion

#region WAVES
waveList = []
waveNumber = 1
currentWaveKills = 0
currentWaveEntityTotal = 10

function Wave(
_waveName = "none",
_maxTimer = 90 + irandom(200),
_cycles =	2 + irandom(2),
_enemies =	1 + irandom(1),
_waveDirection = irandom(waveType.total-1)
) constructor {
	waveName = _waveName
	maxTimer = _maxTimer
	timer = _maxTimer
	cycles = _cycles
	enemies = _enemies
	waveDirection = _waveDirection
	spawnTrigger = 1
}

function generateWave() {
	//wave definition
	var waveName = "Wave #" + string(waveNumber)
	var waveCyclesTotal =	2 + irandom(1 + floor(waveNumber/4))
	var waveEnemiesPerWave =	1 + irandom(1 + floor(waveNumber/4) + floor(waveNumber/4))
	var waveMaxTimer =	(waveCyclesTotal + irandom(floor(waveNumber/4))) * 200
	var waveDirection = validWaveDirection(waveEnemiesPerWave)
	
	var generatedWave = new Wave(waveName,waveMaxTimer,waveCyclesTotal,waveEnemiesPerWave,waveDirection)	
	waveNumber++
	
	currentWaveKills = 0
	currentWaveEntityTotal = generatedWave.enemies
	
	return generatedWave	
}

function validWaveDirection(numberOfEnemies) {
	
	var waveDirection = noone
	
	//only pick directions that are valid according to enemy amount
	if numberOfEnemies <= 1 {
		waveDirection = 3+irandom(3)
		
	} else if numberOfEnemies <= 2 {
		waveDirection = 1+irandom(5)
	
	} else {
		waveDirection = irandom(waveType.total-1)
	}
	
	return waveDirection
}

#endregion

#region SPAWNERS

var arena = obj_arena
spawnerList = []
//top
var arenaTopX = arena.x
var arenaTopY = arena.y - arena.baseWidth
top = instance_create_layer(arenaTopX,arenaTopY,layer,obj_wave_spawner_horisontal)
top.image_xscale = (arena.baseWidth + arena.baseRadius)  / 16 * 2
top.image_yscale = 1
top.updateSpawner()
array_insert(spawnerList,0,top)


//bot
var arenaBottomX = arena.x
var arenaBottomY = arena.y + arena.baseWidth
bottom = instance_create_layer(arenaBottomX,arenaBottomY,layer,obj_wave_spawner_horisontal)
bottom.image_xscale = (arena.baseWidth + arena.baseRadius)  / 16 * 2
bottom.image_yscale = 1
bottom.updateSpawner()
array_insert(spawnerList,1,bottom)

//right
var arenaRightX = arena.x + (arena.baseWidth + arena.baseRadius) 
var arenaRightY = arena.y
right = instance_create_layer(arenaRightX,arenaRightY,layer,obj_wave_spawner_vertical)
right.image_xscale = 1
right.image_yscale = arena.baseWidth / 16 * 2
right.updateSpawner()
array_insert(spawnerList,2,right)

//left
var arenaLeftX = arena.x - (arena.baseWidth + arena.baseRadius) 
var arenaLeftY = arena.y
left = instance_create_layer(arenaLeftX,arenaLeftY,layer,obj_wave_spawner_vertical)
left.image_xscale = 1
left.image_yscale = arena.baseWidth / 16 * 2
left.updateSpawner()
array_insert(spawnerList,3,left)

#endregion