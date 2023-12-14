/// @description Insert description here
// You can write your code in this editor

//style
var listColor = c_ltgray
var highlightColor = c_green

//displacement
var i = 0
var displaceMentY = 16
var displaceMentX = 80

//list adjustments
var listLengthMax = 10
var recentScoreId = array_length(text.scores)

//repeat for each list element
repeat (min(array_length(text.scores),listLengthMax)) {
	
	//score color
	if text.scores[i].scoreId == array_length(text.scores) {
		color = highlightColor
	} else {
		color = listColor
	}
	
	//format time
	var timeFormatted = ""
	if text.scores[i].timer.gameTimeH > 0 {
		timeFormatted += string(text.scores[i].timer.gameTimeH) + " h. " 
	}
	if text.scores[i].timer.gameTimeM > 0 {
		timeFormatted += string(text.scores[i].timer.gameTimeM) + " m. " 
	}
	if text.scores[i].timer.gameTimeS >= 0 {
		timeFormatted += string(text.scores[i].timer.gameTimeS) + " s. " 
	}
	
	scr_textStyle1(x+displaceMentX,y+displaceMentY*i,timeFormatted,font,fa_center,color,alpha,size)
	scr_textStyle1(x,y+displaceMentY*i,"-",font,fa_center,color,alpha,size)
	scr_textStyle1(x-displaceMentX,y+displaceMentY*i,string(i+1)+"# place",font,fa_center,color,alpha,size)
	i++
}
