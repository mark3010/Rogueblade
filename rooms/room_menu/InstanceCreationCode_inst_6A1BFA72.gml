text = "Hull"

setSelection(obj_file_handler.getHullUnlocks())
selected = array_get_index(selection,obj_file_handler.getProgress().blade.hull)

function click() {
	obj_player.updatePlayerHull(getSelection())
}

function name(partEnum) {
	return obj_item_database.getHull(partEnum).name
	}
	
function getDetails() {
	return obj_item_database.getHull(getSelection())
	}