/// @description Insert description here
// You can write your code in this editor
//wave definition
//[timer,totalTimer,waves,enemies,name,waveType]

for (var i = 0; i < array_length(waveList); ++i;) {
	//reduce wave timer
	waveList[i].timer -= 1
	
	//remove wave
	if waveList[i].timer <= 0 {
		waveList[i].cyclesLeft -= 1
		waveList[i].timer = waveList[i].maxTimer
		
		//handle wave distribution
		//determine which spawners to spawn from
		var _pickSpawnerList = [1,2,3,4]
		
		//var _pickSpawnerNumberInverted = irandom(3)
		//for (var k = 0; k < _pickSpawnerNumberInverted; ++k;) {
		//	array_delete(_pickSpawnerList,irandom(array_length(_pickSpawnerList)),1)
		//}
		
		switch (waveList[i].waveDirection) {
			case waveType.ALL:
			//change list to have random amount of random spawners left
				var _pickSpawnerNumberInverted = irandom(3)
				for (var k = 0; k < _pickSpawnerNumberInverted; ++k;) {
					array_delete(_pickSpawnerList,irandom(array_length(_pickSpawnerList)),1)
				}
			break
			case waveType.HORIZONTAL:
				var _pickSpawnerList = [3,4]
			break
			case waveType.VERTICAL:
				var _pickSpawnerList = [1,2]
			break
			case waveType.TOP:
				var _pickSpawnerList = [1]
			break
			case waveType.BOT:
				var _pickSpawnerList = [2]
			break
			case waveType.LEFT:
				var _pickSpawnerList = [4]
			break
			case waveType.RIGHT:
				var _pickSpawnerList = [3]
			break
		}
		

		//determine where to spawn random amount of enemies
		var _numberOfEnemies = waveList[i].enemies
		
		//spawn enemies
		
		//add atleast one to each spawner
		for (var j = 0; j < array_length(_pickSpawnerList); ++j;) {
			array_push(spawnerList[_pickSpawnerList[j]-1].queue,obj_blade)
			_numberOfEnemies--
		}
		
		//add the remaining enemies to random spawners, until no more are left
		while (_numberOfEnemies > 0) {
			var _random = irandom(array_length(_pickSpawnerList)-1)
			var _randomEnemyAmount = irandom(_numberOfEnemies)
			
			for (var l = 0; l < _randomEnemyAmount; ++l;) {
				array_push(spawnerList[_pickSpawnerList[_random]-1].queue,obj_blade)
			}
			
			_numberOfEnemies -= _randomEnemyAmount
		}
	}
}

//check if no more waves are left, delete
for (var o = array_length(waveList)-1; o >= 0; --o;) {
	if waveList[o].cyclesLeft <= 0 {
		delete waveList[o]
		array_delete(waveList,o,1)
	}
}

//if no wave is active, append new wave
if array_length(waveList) == 0 {
		//wave definition
		//[timer,totalTimer,waves,enemies,name,waveType]
		var waveName = "Wave #" + string(waveNumber)
		var waveCyclesTotal =	2 + irandom(2 + floor(waveNumber/4))
		var waveEnemiesPerWave =	1 + irandom(1 + floor(waveNumber/4)) + floor(waveNumber/4)
		
		array_push(waveList,new Wave(waveName,waveCyclesTotal,waveEnemiesPerWave))
		
		waveNumber++
}




