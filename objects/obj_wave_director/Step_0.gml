/// @description Insert description here
// You can write your code in this editor
//wave definition
//[timer,totalTimer,waves,enemies,name,waveType]

for (var i = 0; i < array_length(waveList); ++i;) {
	//reduce wave timer
	waveList[i][0] -= 1
	
	//remove wave
	if waveList[i][0] <= 0 {
		waveList[i][2] -= 1
		waveList[i][0] = waveList[i][1]
		
		//handle wave distribution
		//determine which spawners to spawn from
		var _pickSpawnerList = [1,2,3,4]
		
		//var _pickSpawnerNumberInverted = irandom(3)
		//for (var k = 0; k < _pickSpawnerNumberInverted; ++k;) {
		//	array_delete(_pickSpawnerList,irandom(array_length(_pickSpawnerList)),1)
		//}
		
		switch (waveList[i][5]) {
		
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
		var _numberOfEnemies = waveList[i][3]
		
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
	if waveList[o][2] <= 0 {
		array_delete(waveList,o,1)
	}
}

//if no wave is active, append new wave
if array_length(waveList) == 0 {
		//wave definition
		//[timer,totalTimer,waves,enemies,name,waveType]
		array_push(waveList,[60,60,4,2,"Wave: "+string(waveNumber),irandom(waveType.total-1)])
		waveNumber++
}




