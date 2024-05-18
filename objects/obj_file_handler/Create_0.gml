event_inherited()
#region // UNLOCKS

function getAllUnlocks() {
	var accountLevelUnlocks = []
	
	//ORDER DETERMINES WHICH LEVEL EACH IS UNLOCKED
	array_push(accountLevelUnlocks, {type: "CORE", partEnum : BLADE_CORE.RED})
	array_push(accountLevelUnlocks, {type: "CORE", partEnum : BLADE_CORE.GREEN})
	array_push(accountLevelUnlocks, {type: "CORE", partEnum : BLADE_CORE.ORANGE})
	array_push(accountLevelUnlocks, {type: "HULL", partEnum : BLADE_HULL.HURRICANE})
	array_push(accountLevelUnlocks, {type: "HULL", partEnum : BLADE_HULL.BLOSSOM})
	
	//TODO CHANGE THIS VAR RIGHT HERE TO BE CURRENT ACCOUNT LEVEL
	var currentAccountLevel = array_length(accountLevelUnlocks)
	
	var currentUnlocks = []
	array_copy(currentUnlocks,0,accountLevelUnlocks,0,currentAccountLevel)

	return currentUnlocks
}

function getCoreUnlocks() {
	var unlocks = []
	array_push(unlocks,BLADE_CORE.BLUE) // base unlock
	
	//add unlocks from progression
	var accountLevelUnlocks = getAllUnlocks()
	
	for (var i = 0; i < array_length(accountLevelUnlocks); i++) {
		if accountLevelUnlocks[i].type == "CORE" {
			array_push(unlocks,accountLevelUnlocks[i].partEnum)
		}
	}
	
	return unlocks
} 

function getHullUnlocks() {
	var unlocks = []
	array_push(unlocks,BLADE_HULL.BALANCE) // base unlock
	
	//add unlocks from progression
	var accountLevelUnlocks = getAllUnlocks()
	
	for (var i = 0; i < array_length(accountLevelUnlocks); i++) {
		if accountLevelUnlocks[i].type == "HULL" {
			array_push(unlocks,accountLevelUnlocks[i].partEnum)
		}
	}

	return unlocks
}

function getAnchorUnlocks() {
	var unlocks = []
	array_push(unlocks,BLADE_ANCHOR.PELLET) // base unlock
	
	//add unlocks from progression
	var accountLevelUnlocks = getAllUnlocks()
	
	for (var i = 0; i < array_length(accountLevelUnlocks); i++) {
		if accountLevelUnlocks[i].type == "ANCHOR" {
			array_push(unlocks,accountLevelUnlocks[i].partEnum)
		}
	}
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