text = "Anchor"
selected = obj_file_handler.getProgress().blade.anchor
setSelection(BLADE_ANCHOR.NUM)

function click() {
	obj_player.updatePlayerAnchor(getSelection())
}