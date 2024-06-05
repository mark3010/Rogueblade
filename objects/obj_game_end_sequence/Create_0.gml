/// @description Insert description here
// You can write your code in this editor
global.inputHighjack = true
color = #E3F1F1
//SAVE DATA
//data file structure
var dataImprint = {
	timer : {
		gameTime : obj_timer.gameTime,
		},
	wave : obj_wave_director.waveList,
	kills : obj_killCounter.kills
}

//data file object
saveFile = instance_create_depth(x,y,depth,obj_save_score_snapshot)
saveFile.data = dataImprint

//END GAME SEQUENCE
timer = 0
delay = 60

function popUp1() {overlayFlag = true}
function popUp2() {overlayText1Flag = true}
function popUp3() {overlayText2Flag = true}
function popUp4() {overlayText3Flag = true}

queue = [popUp1,popUp2,popUp3,popUp4]
queue = array_reverse(queue)



//ANIMATION
overlayAlpha = 0
overlayFlag = false

overlayText1Alpha = 0
overlayText1Flag = false

overlayText2Alpha = 0
overlayText2Flag = false

overlayText3Alpha = 0
overlayText3Flag = false