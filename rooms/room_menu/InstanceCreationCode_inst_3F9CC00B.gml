text = "Anchor"
selected = obj_file_handler.getProgress().blade.anchor
setSelection(obj_file_handler.getAnchorUnlocks())

function click() {
	obj_player.updatePlayerAnchor(getSelection())
}

function name(partEnum) {
	return obj_item_database.getAnchor(partEnum).name
	}

function getDetails() {
	return obj_item_database.getAnchor(getSelection())
	}