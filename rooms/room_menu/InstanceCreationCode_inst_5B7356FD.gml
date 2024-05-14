text = "Core"
selected = obj_file_handler.getProgress().blade.core
setSelection(BLADE_CORE.NUM)

function click() {
	obj_player.updatePlayerCore(getSelection())
}