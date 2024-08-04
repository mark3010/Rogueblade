/// @description Insert description here
// You can write your code in this editor

timer++

if keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) {
	timer = delay
}


if timer == delay && array_length(queue) > 0 {
	queue[array_length(queue)-1]()
	array_pop(queue)
	timer = 0
}

//if overlayFlag {
	overlayAlpha = lerp(overlayAlpha,1,0.1)
//}

if overlayText1Flag {
	overlayText1Alpha = lerp(overlayText1Alpha,1,0.1)
}

if overlayText2Flag {
	overlayText2Alpha = lerp(overlayText2Alpha,1,0.1)
}

if overlayText3Flag {
	overlayText3Alpha = lerp(overlayText3Alpha,1,0.1)
}