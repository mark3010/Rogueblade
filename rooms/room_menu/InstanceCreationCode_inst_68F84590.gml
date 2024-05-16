text = "Try out blade"


function click() {
	obj_ui_selector.goToPage("lay_menu2_1_1")
	global.guiTestEnable = true
	obj_cam.pan()
	obj_cam.zoomAdd(0)
}