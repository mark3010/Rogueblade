text = "Start run"

function click() {
	obj_controller.startRun()
	obj_ui_selector.goToPage("lay_menu999")
	obj_ui_selector.forget()
}