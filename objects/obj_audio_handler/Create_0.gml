/// @description Insert description here
// You can write your code in this editor
event_inherited()

//each sound type has it's own sound category with an interval of designated ssound channels
//CATEGORIES
channelsUI =		[1,2,3,4,5]
channelsEffects =	[6,7,8,9,10]
channelsMusic =		[11,12,13,14,15]
channelsAmbient =	[16,17,18,19,20]

queueUI = []
queueEffects = []
queueMusic = []
queueAmbient = []

function distributeSound() {

}

function cut_UISounds() {
	//audio
}

//ALL SOUNDS
	//effects
function play_effectHitNoShield() {
	array_push(queueEffects,snd_collision_health)	
}
function play_effectHitShield() {
	array_push(queueEffects,snd_collision_trigger)	
}
	//music
function play_music1() {
	array_push(queueMusic,snd_music)	
}