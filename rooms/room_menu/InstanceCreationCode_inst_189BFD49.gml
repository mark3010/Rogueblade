triggerKey = vk_anykey
text = "press ANY KEY to start"

function click() {
	if instance_exists(obj_player) {
		obj_ui_selector.goToPage("lay_menu1")
	}
}