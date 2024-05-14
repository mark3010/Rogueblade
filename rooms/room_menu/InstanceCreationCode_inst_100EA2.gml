text = "press ESCAPE to go back to menu"
triggerKey = vk_escape
function click() {
	obj_ui_selector.goBack()
	global.guiTestEnable = false
}