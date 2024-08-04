//add saved scores to highscore list
if instance_exists(obj_save_score_snapshot) {
	//grab saved score file
	var highscore = obj_save_score_snapshot.data
	instance_destroy(obj_save_score_snapshot)
	
	//load highscore list
	var scoreData = loadScores(scoreFileName)

	//make score id
	var generatedId = array_length(scoreData.scores)+1
	highscore.scoreId = generatedId
	
	//add score to highscore file
	array_push(scoreData.scores,highscore)

	//sort highscores with algorithm
	array_sort(scoreData.scores,scoreSort)
	
	//update saveFile
	saveScores(scoreData,scoreFileName)
}

//add saved scores to highscore list
if instance_exists(obj_save_progress_snapshot) {
	//grab saved score file
	var progress = obj_save_progress_snapshot.data
	instance_destroy(obj_save_progress_snapshot)
	
	//update saveFile
	saveProgress(progress,progressDataFileName)
}