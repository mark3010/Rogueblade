
//add saved scores to highscore list
if instance_exists(obj_save_file) {
	//grab saved score file
	var highscore = obj_save_file.data
	instance_destroy(obj_save_file)
	
	//load highscore list
	var scoreData = loadScores(scoreFileName)

	var targetId = array_length(scoreData.scores)+1
	highscore.targetId = targetId
	
	//add score to highscore file
	array_push(scoreData.scores,highscore)

	//sort highscores with algorithm
	array_sort(scoreData.scores,scoreSort)

	scoreData.recentPos = 0
	
	var topTenFlag = false
	var i = 0
	
	while (topTenFlag == false) {
		if scoreData.scores[i].targetId = targetId {
			topTenFlag = true
			scoreData.recentPos = i
		}
		if i > 9 {exit}
		i++
	}
	
	//update saveFile
	saveScores(scoreData,scoreFileName)
}