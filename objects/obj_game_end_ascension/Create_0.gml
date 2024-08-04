/// @description Insert description here
// You can write your code in this editor
color = #E3F1F1
textDisplay = true
progress = obj_file_handler.getProgress()

//END GAME SEQUENCE
timer = 0
delay = 60

function popUp2() {
	overlayText1Flag = true
	var title = instance_create_layer(x,y+176,layer,obj_ui_unselectable_menu_title)
	title.text = "YOU ARE THE ROGUEBLADE CHAMPION!"
	title.x = 960/2
	title.y = 540/2-90
	}
function popUp3() {
	overlayText2Flag = true
	progress = obj_file_handler.getProgress()
	show_debug_message(progress)
	}
function popUp4() {overlayText3Flag = true}
function popUp5() {
	//overlayText3Flag = true
	
	var skipButton = instance_create_layer(x,y+176,layer,obj_ui_unselectable)
	//
	skipButton.triggerKey = vk_space
	skipButton.text = "press SPACE to continue"

	with skipButton {
		function click() {
			obj_controller.closeRun()
			instance_destroy()
		}
	}
	
	}
	
popUp2()
queue = [popUp3,popUp4,popUp5]
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