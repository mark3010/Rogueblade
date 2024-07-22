/// @description Insert description here
// You can write your code in this editor

timer++
//alarm_set(1,60) // alarm 1 is to show overlay
//alarm_set(2,90) // alarm 2 is to show overlay1 text
//alarm_set(3,120) // alarm 3 is to show overlay2 text
//alarm_set(0,360) // alarm 0 is go to highscore room

if keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) {
	timer = delay
	
	if array_length(queue) == 0 {
		//from end screen go to highscores
		instance_create_layer(x,y,layer,obj_text_highscore_list)
		textDisplay = false
		//room_goto(room_highscore)
	}
}


if timer == delay && array_length(queue) > 0 {
	queue[array_length(queue)-1]()
	array_pop(queue)
	timer = 0
}



if overlayFlag {
	overlayAlpha = lerp(overlayAlpha,0.7,0.1)
}

if overlayText1Flag {
	overlayText1Alpha = lerp(overlayText1Alpha,1,0.1)
}

if overlayText2Flag {
	overlayText2Alpha = lerp(overlayText2Alpha,1,0.1)
}

if overlayText3Flag {
	overlayText3Alpha = lerp(overlayText3Alpha,1,0.1)
}