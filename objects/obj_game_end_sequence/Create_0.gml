/// @description Insert description here
// You can write your code in this editor
color = #E3F1F1
textDisplay = true
endScore = 0

gameActivePrevious = global.gameActive // used to determine when game is over and save is made
function saveRun() {
	//SAVE SCORE DATA
	//data file structure
	var dataImprint = {
		timer : {
			gameTime : 0,
			},
		wave : 0,
		kills : 0,
		killScore : 0
	}
	if instance_exists(obj_timer) {dataImprint.timer.gameTime = obj_timer.gameTime}
	if instance_exists(obj_wave_director) {dataImprint.wave = obj_wave_director.waveList}
	if instance_exists(obj_arenaStatCounter) {
		dataImprint.kills = obj_arenaStatCounter.kills
	}

	//data file object
	saveFile = instance_create_depth(x,y,depth,obj_save_score_snapshot)
	saveFile.data = dataImprint

	//SAVE PROGRESS DATA
	//data file structure
	var dataImprint = obj_file_handler.getProgress()
	//var dataImprint = {
	//	accountExperience : 0,
	//	ascensionComplete : 0
	//}
	
	if instance_exists(obj_arenaStatCounter) {
		dataImprint.accountExperience += obj_arenaStatCounter.killScore
		if obj_arenaStatCounter.ascensionComplete {dataImprint.difficultyLevel++}
	}
	
	//data file object
	saveFile = instance_create_depth(x,y,depth,obj_save_progress_snapshot)
	saveFile.data = dataImprint
}

//END GAME SEQUENCE
timer = 0
delay = 60

function popUp1() {
	overlayFlag = true
	if instance_exists(obj_arenaStatCounter) {
		endScore = obj_arenaStatCounter.killScore
	}
	}
function popUp2() {
	overlayText1Flag = true
	var title = instance_create_layer(x,y,layer,obj_ui_unselectable_menu_title)
	title.text = "THE SIMULATION HAS ENDED"
	title.x = 960/2
	title.y = 540/2-20
	}
function popUp3() {overlayText2Flag = true}
//function popUp4() {overlayText3Flag = true}
function popUp4() {
	//overlayText3Flag = true
	
	var skipButton = instance_create_layer(x,y+176,layer,obj_ui_unselectable)
	//
	skipButton.triggerKey = vk_space
	skipButton.text = "press SPACE to continue"

	with skipButton {
		function click() {
		obj_ui_selector.goToPage("lay_menu1")
		}
	}
	
	}

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