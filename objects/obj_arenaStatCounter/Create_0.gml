/// @description Insert description here
// You can write your code in this editor
kills = 0
killScore = 0
ascensionComplete = true

function countKill(type,groupId) {
	kills++
	
	if instance_exists(obj_wave_director) {
		if groupId == obj_wave_director.waveNumber {
			obj_wave_director.currentWaveKills++
		}
	}
	killScore += 10
}