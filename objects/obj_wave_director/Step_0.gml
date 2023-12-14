/// @description Insert description here
// You can write your code in this editor
//wave definition
//[timer,totalTimer,waves,enemies,name,waveType]

if !global.gameActive exit

#region WAVELIST CALCULATION
for (var i = 0; i < array_length(waveList); ++i;) {
	//reduce wave timer
	waveList[i].timer -= 1
	
	if waveList[i].timer mod waveList[i].spawnTrigger == 0 {

		//handle wave distribution
		//determine which spawners to spawn from
		var pickSpawnerList = [1,2,3,4]
		
		switch (waveList[i].waveDirection) {
			case waveType.ALL:
			//change list to have random amount of random spawners left
				var pickSpawnerNumberInverted = irandom(3)
				for (var k = 0; k < pickSpawnerNumberInverted; ++k;) {
					array_delete(pickSpawnerList,irandom(array_length(pickSpawnerList)),1)
				}
			break
			case waveType.HORIZONTAL:
				var pickSpawnerList = [3,4]
			break
			case waveType.VERTICAL:
				var pickSpawnerList = [1,2]
			break
			case waveType.TOP:
				var pickSpawnerList = [1]
			break
			case waveType.BOT:
				var pickSpawnerList = [2]
			break
			case waveType.LEFT:
				var pickSpawnerList = [4]
			break
			case waveType.RIGHT:
				var pickSpawnerList = [3]
			break
		}
		
		//scramble selection
		pickSpawnerList = array_shuffle(pickSpawnerList)

		//determine where to spawn random amount of enemies
		var numberOfEnemies = waveList[i].enemies
		
		//add atleast one to each spawner
		for (var j = 0; j < array_length(pickSpawnerList); ++j;) {
			array_push(spawnerList[pickSpawnerList[j]-1].queue,obj_blade)
			numberOfEnemies--
		}
		
		//add the remaining enemies to random spawners, until no more are left
		while (numberOfEnemies > 0) {
			var randomInt = irandom(array_length(pickSpawnerList)-1)
			var randomEnemyAmount = irandom(numberOfEnemies)
			
			for (var l = 0; l < randomEnemyAmount; ++l;) {
				array_push(spawnerList[pickSpawnerList[randomInt]-1].queue,obj_blade)
			}
			
			numberOfEnemies -= randomEnemyAmount
		}
	}
}
#endregion

#region WAVELIST DESTROY
//check if no more waves are left, delete
for (var o = array_length(waveList)-1; o >= 0; --o;) {
	if waveList[o].timer <= 0 {
		delete waveList[o]
		array_delete(waveList,o,1)
	}
}
#endregion

#region NEW WAVE GENERATOR
//if no wave is active, append new wave
if array_length(waveList) == 0 {
	array_push(waveList,generateWave())
}
#endregion




