/// @description Insert description here
// You can write your code in this editor
var i = 0
var displaceMentY = 16
var displaceMentX = 80

repeat (min(array_length(text.scores),10)) {

	if text.recentPos == i {color = c_green} else {color = c_ltgray}

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
