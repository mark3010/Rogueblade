/// @description Insert description here
// You can write your code in this editor

//style
var listColor = global.txtColHighlight
var highlightColor = global.txtColPositive

//header

//scr_textStyle1(x,y-80,"Highscore",font,fa_center,listColor,alpha,2)


//displacement
var i = 0
var displaceMentY = 16
var displaceMentX = 80

//list adjustments
var listLengthMax = 10
//var recentScoreId = array_length(text.scores)

//set scorelist design
var _f = function(_element, _index) {
    return (_element.scoreId == array_length(text.scores))
}

var newestScorePos = array_find_index(text.scores, _f);

var design = 0
var displaceList = 0
if 10 < newestScorePos {
	design = 1
}


//repeat for each list element
repeat (min(array_length(text.scores),listLengthMax)) {
	//skip if no entry exists to draw
	if i+displaceList+1 >= array_length(text.scores) {exit}
	
	//score color
	if text.scores[i+displaceList].scoreId == array_length(text.scores) { //if score is most recent
		color = highlightColor
		newHighScoreFlag = true
	} else {
		color = listColor
	}
	
	//change design if score below 10th place
	if design == 1 && i == 3 {							
		//MAKE LIST SKIP
		//draw entry "skip" to screen
		scr_textStyle1(x+displaceMentX,y+displaceMentY*i,"...",font,fa_center,color,alpha,size)				//right side
		scr_textStyle1(x,y+displaceMentY*i,"...",font,fa_center,color,alpha,size)							//middle
		scr_textStyle1(x-displaceMentX,y+displaceMentY*i,"...",font,fa_center,color,alpha,size)				//left side
		
		displaceList = newestScorePos - 9 + clamp(array_length(text.scores) - newestScorePos,0,3)
	} else {											
		//MAKE ENTRY
		//format time
		var timeFormatted = obj_text_formatter.gameTimeFormatted(text.scores[i+displaceList].timer.gameTime)
	
		if i == 9 && (i+displaceList) != array_length(text.scores) {
			//draw entry "skip" to screen
			scr_textStyle1(x+displaceMentX,y+displaceMentY*i,"...",font,fa_center,color,alpha,size)				//right side
			scr_textStyle1(x,y+displaceMentY*i,"...",font,fa_center,color,alpha,size)							//middle
			scr_textStyle1(x-displaceMentX,y+displaceMentY*i,"...",font,fa_center,color,alpha,size)				//left side
		} else {
			//draw entry to screen
			scr_textStyle1(x+displaceMentX,y+displaceMentY*i,timeFormatted,font,fa_center,color,alpha,size)			//right side
			scr_textStyle1(x,y+displaceMentY*i,"-",font,fa_center,color,alpha,size)									//middle
			scr_textStyle1(x-displaceMentX,y+displaceMentY*i,string(i+1+displaceList)+"# place",font,fa_center,color,alpha,size)	//left side
		}
	}
	
	i++
}

//remake to show new top 10 high score
//if newHighScoreFlag {scr_textStyle1(x,y-displaceMentY*i,"*NEW HIGHSCORE*",font,fa_center,highlightColor,alpha,size)}
