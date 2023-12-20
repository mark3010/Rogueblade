if stage == 1 {
	lifetime++
} else {
	lifetime--
}

if lifetime >= trigger {
	stage++
	room_goto(roomTarget)
}

if lifetime < 0 {
	instance_destroy()
}