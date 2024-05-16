text = "Core"
selected = obj_file_handler.getProgress().blade.core
setSelection(obj_file_handler.getCoreUnlocks())

function click() {
	obj_player.updatePlayerCore(getSelection())
}

function name(partEnum) {
	return obj_item_database.getCore(partEnum).name
	}

function getDetails() {
	return obj_item_database.getCore(getSelection())
	}