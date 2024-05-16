text = "Hull"
selected = obj_file_handler.getProgress().blade.hull
setSelection(obj_file_handler.getHullUnlocks())

function click() {
	obj_player.updatePlayerHull(getSelection())
}

function name(partEnum) {
	return obj_item_database.getHull(partEnum).name
	}
	
function getDetails() {
	return obj_item_database.getHull(getSelection())
	}