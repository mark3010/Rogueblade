text = "Core"
setSelection(obj_file_handler.getCoreUnlocks())
selected = array_get_index(selection,obj_file_handler.getProgress().blade.core)

function click() {
	obj_player.updatePlayerCore(getSelection())
}

function name(partEnum) {
	return obj_item_database.getCore(partEnum).name
	}

function getDetails() {
	return obj_item_database.getCore(getSelection())
	}