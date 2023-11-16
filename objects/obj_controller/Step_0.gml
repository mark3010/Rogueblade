//DEBUG OPTIONS

if keyboard_check_pressed(vk_f4) {
    global.debugMode *= -1 
}

if (keyboard_check_pressed(ord("R"))) {
	room_restart()
}