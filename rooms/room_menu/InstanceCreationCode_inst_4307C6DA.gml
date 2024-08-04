text = "Ascension level"

setSelection(obj_file_handler.getCurrentDifficultyLevels())
selected = array_get_index(selection,obj_file_handler.getProgress().difficultyLevelSelected)
//selected = obj_file_handler.getProgress().difficultyLevelSelected

function name(partEnum) {
	var cleared = ""
	
	if partEnum < obj_file_handler.getDifficultyLevelMax() {
		//cleared = "[COMPLETED]"
	}
	
	return (string(obj_file_handler.getCurrentDifficultyLevels()[partEnum])+cleared)
	}

function getDetails() {
	return "DEFINE IN OBJECT CREATION -> ROOM EDITOR"
}
	
function click() {
	var data = obj_file_handler.getProgress()
	data.difficultyLevelSelected = getSelection()
	
	var save = instance_create_layer(x,y,layer,obj_save_progress_snapshot)
	save.data = data
	
}