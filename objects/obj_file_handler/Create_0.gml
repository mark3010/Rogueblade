event_inherited()
#region // UNLOCKS

//later add connection to player unlocks
function getCoreUnlocks() {
	var unlocks = []
	array_push(unlocks,BLADE_CORE.BLUE)
	array_push(unlocks,BLADE_CORE.RED)
	array_push(unlocks,BLADE_CORE.GREEN)
	array_push(unlocks,BLADE_CORE.ORANGE)
	return unlocks
}

function getHullUnlocks() {
	var unlocks = []
	array_push(unlocks,BLADE_HULL.BALANCE)
	array_push(unlocks,BLADE_HULL.HURRICANE)
	array_push(unlocks,BLADE_HULL.BLOSSOM)

	return unlocks
}

function getAnchorUnlocks() {
	var unlocks = []
	array_push(unlocks,BLADE_ANCHOR.PELLET)
	return unlocks
}
#endregion
#region // GAME PROGRESS

//GAME DATA SAVE FILE
progressDataFileName = "gameData"
dataFileBlueprint = {
	accountLevel : 0,
	accountExperience : 0,
	difficultyLevel : 0,
	difficultyLevelSelected : 0,
	blade : {	core : 0,
				hull : 0,
				anchor : 0
			},
	conditionalUnlocks : {}
}

//GAME PROGRESS FILE HANDLING
function saveProgress(data, progressDataFileName) {
	var json = json_stringify(data)
	
	var buffer = buffer_create(string_byte_length(json)+1, buffer_fixed, 1)
	buffer_write(buffer, buffer_string,json)
	buffer_save(buffer, progressDataFileName)
	buffer_delete(buffer)
}

function loadProgress(progressDataFileName) {
	if (!file_exists(progressDataFileName)) {
		return
	}
	
	var buffer = buffer_load(progressDataFileName)
	var json = buffer_read(buffer, buffer_string)
	var fileStruct = json_parse(json)
	
	buffer_delete(buffer)
	return fileStruct
}

function getProgress() {
	var progressData = loadProgress(progressDataFileName)
	return progressData
}

//GENERATE SAVE FILE
if (!file_exists(progressDataFileName)) {
	saveProgress(dataFileBlueprint, progressDataFileName)
}

#endregion

#region // HIGH SCORES

//HIGHSCORE SAVE FILE
scoreFileName = "highscores"
highscoreBlueprint = {
	scores : [],
}

//SCORE FILE HANDLING
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

#endregion