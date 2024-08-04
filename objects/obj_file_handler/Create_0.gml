event_inherited()


accountDifficultyLevelUnlocks = []
	
//ORDER DETERMINES WHICH LEVEL EACH IS UNLOCKED
array_push(accountDifficultyLevelUnlocks, {description: "adds x modifier to the run"})
array_push(accountDifficultyLevelUnlocks, {description: "adds x modifier to the run"})
array_push(accountDifficultyLevelUnlocks, {description: "adds x modifier to the run"})
array_push(accountDifficultyLevelUnlocks, {description: "adds x modifier to the run"})
array_push(accountDifficultyLevelUnlocks, {description: "adds x modifier to the run"})
array_push(accountDifficultyLevelUnlocks, {description: "adds x modifier to the run"})
array_push(accountDifficultyLevelUnlocks, {description: "adds x modifier to the run"})
array_push(accountDifficultyLevelUnlocks, {description: "adds x modifier to the run"})
array_push(accountDifficultyLevelUnlocks, {description: "adds x modifier to the run"})
array_push(accountDifficultyLevelUnlocks, {description: "adds x modifier to the run"})

accountDifficultyLevelMax = array_length(accountDifficultyLevelUnlocks)

function getCurrentDifficultyLevels() {
	//var allDifficulties = array_length(accountDifficultyLevelUnlocks)
	var currentMaxDifficulty = obj_file_handler.getProgress().difficultyLevel
	
	var currentDifficulties = []
	
	for (var i = 0; i <= currentMaxDifficulty; i++) {
		array_push(currentDifficulties,i)
	}
	//array_copy(currentUnlocks,0,accountLevelUnlocks,0,currentAccountLevel)
	//show_debug_message("------------------------------CURRENT")
	//show_debug_message(currentDifficulties)
	return currentDifficulties
}

function getDifficultyLevelMax() {
	return accountDifficultyLevelMax
}

function getAllDifficulties() {
	return accountDifficultyLevelUnlocks
}

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
	
	var allUnlocks = []
	array_copy(allUnlocks,0,accountLevelUnlocks,0,currentAccountLevel)

	return allUnlocks
}

function getCurrentUnlocks() {
	var accountLevelUnlocks = []
	
	//ORDER DETERMINES WHICH LEVEL EACH IS UNLOCKED
	array_push(accountLevelUnlocks, {type: "CORE", partEnum : BLADE_CORE.RED})
	array_push(accountLevelUnlocks, {type: "CORE", partEnum : BLADE_CORE.GREEN})
	array_push(accountLevelUnlocks, {type: "CORE", partEnum : BLADE_CORE.ORANGE})
	array_push(accountLevelUnlocks, {type: "HULL", partEnum : BLADE_HULL.HURRICANE})
	array_push(accountLevelUnlocks, {type: "HULL", partEnum : BLADE_HULL.BLOSSOM})
	
	//TODO CHANGE THIS VAR RIGHT HERE TO BE CURRENT ACCOUNT LEVEL
	var currentAccountLevel = getProgress().accountLevel
	
	var currentUnlocks = []
	array_copy(currentUnlocks,0,accountLevelUnlocks,0,currentAccountLevel)

	return currentUnlocks
}

function getCoreUnlocks() {
	var unlocks = []
	array_push(unlocks,BLADE_CORE.BLUE) // base unlock
	
	//add unlocks from progression
	var accountLevelUnlocks = getCurrentUnlocks()
	
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
	var accountLevelUnlocks = getCurrentUnlocks()
	
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
	var accountLevelUnlocks = getCurrentUnlocks()
	
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

//GAME PROGRESS UTIL
#region //EXP variables
var EXPBaseCap = 5
var EXPBaseExponential = 1.15
var maxLevel = 50
EXPCapList = []
for (var i = 0; i < maxLevel-1; i++) {
	EXPCapList[i] = round(EXPBaseCap * power(EXPBaseExponential,i))
}

function getMaxAccountExperience() {
	var i = 0
	var allowedMaximumExp = 0
	repeat(array_length(getAllUnlocks())) {
		allowedMaximumExp += EXPCapList[i]
		i++
	}
	//show_debug_message("allowed max exp: "+string(allowedMaximumExp))
	//show_debug_message("expcaplist: "+string(EXPCapList))
	return allowedMaximumExp
}
#endregion

//GAME PROGRESS FILE HANDLING
//update account level
function updateAccountLevel(data) {
	var totalExp = 0
	var accountLevelCalculated = -1
	var i = 0
	while data.accountExperience - totalExp >= 0 {
		totalExp += EXPCapList[i]
		accountLevelCalculated++
		i++	
	}
	
	//return to max limit level
	if accountLevelCalculated >= array_length(getAllUnlocks()) {
		accountLevelCalculated = array_length(getAllUnlocks())
		data.accountExperience = getMaxAccountExperience()
	}
	
	data.accountLevel = accountLevelCalculated
	/*
	//return to max limit exp
	if data.accountExperience > EXPCapList[array_length(getAllUnlocks())] {
		data.accountExperience = EXPCapList[array_length(getAllUnlocks())]
	}*/
	

	return data
}

function updateDifficultyLevel(data) {

	
	//return to max limit level
	if data.difficultyLevel > getDifficultyLevelMax() {
		data.difficultyLevel = getDifficultyLevelMax()
	}
	

	/*
	//return to max limit exp
	if data.accountExperience > EXPCapList[array_length(getAllUnlocks())] {
		data.accountExperience = EXPCapList[array_length(getAllUnlocks())]
	}*/
	

	return data
}

function saveProgress(data, progressDataFileName) {
	
	//var currentData = getProgress()
	
	
	//update account level
	data = updateAccountLevel(data)
	data = updateDifficultyLevel(data)
	//show_debug_message("-----")
	//show_debug_message("saving progress")
	//show_debug_message("acc level: "+string(data.accountLevel))
	//show_debug_message("acc exp: "+string(data.accountExperience))
	
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
	//show_debug_message("-----")
	//show_debug_message("loading progress")
	//show_debug_message("acc level: "+string(fileStruct.accountLevel))
	//show_debug_message("acc exp: "+string(fileStruct.accountExperience))
	
	return fileStruct
}

function getProgress() {
	var progressData = loadProgress(progressDataFileName)
	return progressData
}

function resetProgress() {
	saveProgress(dataFileBlueprint, progressDataFileName)
}

//GENERATE SAVE FILE
if (!file_exists(progressDataFileName)) {
	resetProgress()
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