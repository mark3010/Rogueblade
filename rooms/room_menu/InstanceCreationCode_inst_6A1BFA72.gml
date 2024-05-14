text = "Hull"
selected = obj_file_handler.getProgress().blade.hull
setSelection(BLADE_HULL.NUM)

function click() {
	obj_player.updatePlayerHull(getSelection())
}