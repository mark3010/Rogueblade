text = "press ESCAPE to go back to menu"
triggerKey = vk_escape
function click() {
	obj_ui_selector.goBack()
	global.guiTestEnable = false
	global.inputHighjack = true
	obj_cam.followTarget(obj_player)
	obj_cam.zoomAdd(-.5)
}