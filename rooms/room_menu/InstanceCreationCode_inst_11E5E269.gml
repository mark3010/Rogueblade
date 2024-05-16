text = "Back"
triggerKey = vk_escape

function click() {
	obj_ui_selector.goBack()
	obj_cam.zoomAdd(0)
	obj_cam.followTarget(obj_player)
}