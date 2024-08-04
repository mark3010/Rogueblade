/// @description Insert description here
// You can write your code in this editor

timer++

if timer == delay && array_length(queue) > 0 {
	queue[array_length(queue)-1]()
	array_pop(queue)
	timer = 0
}

if overlayFlag {
	overlayAlpha = lerp(overlayAlpha,0.7,0.1)
}