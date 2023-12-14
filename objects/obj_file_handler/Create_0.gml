event_inherited()

//HIGHSCORE SAVE FILE
scoreFileName = "highscores"
highscoreBlueprint = {
	scores : [],
}

//FILEHANDLING
function saveScores(data, scoreFileName) {
	var json = json_stringify(data)
	
	var buffer = buffer_create(string_byte_length(json)+1, buffer_fixed, 1)
	buffer_write(buffer, buffer_string,json)
	buffer_save(buffer, scoreFileName)
	buffer_delete(buffer)
}

function loadScores(scoreFileName) {
	if (!file_exists(scoreFileName)) {
		return
	}
	
	var buffer = buffer_load(scoreFileName)
	var json = buffer_read(buffer, buffer_string)
	var fileStruct = json_parse(json)
	
	buffer_delete(buffer)
	return fileStruct
}

function getScores() {
	var scores = loadScores(scoreFileName)
	return scores
}

//HIGHSCORE SORTING ALGORITHM
function scoreSort(element1,element2) {
		return element2.timer.gameTime - element1.timer.gameTime
	}

//GENERATE SAVE FILE
if (!file_exists(scoreFileName)) {
	saveScores(highscoreBlueprint, scoreFileName)
}

