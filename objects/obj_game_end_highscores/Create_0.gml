/// @description Insert description here
// You can write your code in this editor
color = #E3F1F1
textDisplay = true


//END GAME SEQUENCE
timer = 0
delay = 60

function popUp2() {
	overlayText1Flag = true
	var title = instance_create_layer(x,y,layer,obj_ui_unselectable_menu_title)
	title.text = "SCOREBOARD"
	title.x = x
	title.y = y-80
	instance_deactivate_object(title)
	}
function popUp3() {
	overlayText2Flag = true
	var scores = instance_create_layer(x,y,layer,obj_text_highscore_list)
	scores.x = x
	scores.y = y-60
	}
//function popUp4() {overlayText3Flag = true}
function popUp4() {
	//overlayText3Flag = true
	
	var skipButton = instance_create_layer(x,y+176,layer,obj_ui_unselectable)
	//
	skipButton.triggerKey = vk_space
	skipButton.text = "press SPACE to continue"

	with skipButton {
		function click() {
		obj_ui_selector.goToPage("lay_menu3")
		}
	}
	
	}
	
popUp2()
queue = [popUp3,popUp4]
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