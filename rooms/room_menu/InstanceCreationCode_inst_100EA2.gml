text = "press ESCAPE to go back to menu"
triggerKey = vk_escape
function click() {
	obj_menu_page_handler.goTo("lay_menu2_1")
	global.guiTestEnable = false
}