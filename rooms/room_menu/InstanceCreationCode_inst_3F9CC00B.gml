text = "Anchor"
setSelection(obj_file_handler.getAnchorUnlocks())
selected = array_get_index(selection,obj_file_handler.getProgress().blade.anchor)

function click() {
	obj_player.updatePlayerAnchor(getSelection())
}

function name(partEnum) {
	return obj_item_database.getAnchor(partEnum).name
	}

function getDetails() {
	return obj_item_database.getAnchor(getSelection())
	}