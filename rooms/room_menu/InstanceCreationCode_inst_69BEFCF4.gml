text = "Save"
triggerKey = vk_escape

function click() {
	var fileName = obj_file_handler.progressDataFileName
	var data = obj_file_handler.loadProgress(fileName)
	
	with (obj_ui_selectable_shift) {
		if text = "Core" {data.blade.core = getSelection()}
		if text = "Hull" {data.blade.hull = getSelection()}
		if text = "Anchor" {data.blade.anchor = getSelection()}
	}
	
	obj_file_handler.saveProgress(data,fileName)
	obj_ui_selector.goBack()
}