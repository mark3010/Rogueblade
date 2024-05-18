event_inherited()


draw_set_alpha(1)
// z-depth of arena

draw_rectangle_color(x-baseWidth-baseRadius,y,x+baseWidth+baseRadius,y+baseRadius*5,colSides,colSides,colSidesBot,colSidesBot,false)

// top sloped area of arena

var scalar = 1
var flip = 1
repeat(2) { // draws right side, flips to draw left
	draw_set_color(colSlant4)
	draw_rectangle(x,y-baseRadius/scalar,x+baseWidth*flip,y+baseRadius/scalar,false)
	draw_circle(x+baseWidth*flip,y,baseRadius/scalar,false)
	flip *= -1
}
var scalar = 1.3
var flip = 1
repeat(2) { // draws right side, flips to draw left
	draw_set_color(colSlant3)
	draw_rectangle(x,y-baseRadius/scalar,x+baseWidth*flip,y+baseRadius/scalar,false)
	draw_circle(x+baseWidth*flip,y,baseRadius/scalar,false)
	flip *= -1
}
var scalar = 1.6
var flip = 1
repeat(2) { // draws right side, flips to draw left
	draw_set_color(colSlant2)
	draw_rectangle(x,y-baseRadius/scalar,x+baseWidth*flip,y+baseRadius/scalar,false)
	draw_circle(x+baseWidth*flip,y,baseRadius/scalar,false)
	flip *= -1
}
var scalar = 2
var flip = 1
repeat(2) { // draws right side, flips to draw left
	draw_set_color(colSlant1)
	draw_rectangle(x,y-baseRadius/scalar,x+baseWidth*flip,y+baseRadius/scalar,false)
	draw_circle(x+baseWidth*flip,y,baseRadius/scalar,false)
	flip *= -1
}

// flat area of arena
var flip = 1
repeat(2) { // draws right side, flips to draw left
	draw_set_color(colFlat)
	draw_rectangle(x,y-flatRadius,x+baseWidth*flip,y+flatRadius,false)
	draw_circle(x+baseWidth*flip,y,flatRadius,false)
	flip *= -1
}

//DRAW ARENA INFO
/*
draw_set_color(merge_color(c_black,c_gray,.6))
draw_set_alpha(1)
draw_set_font(font_freefall)
draw_set_halign(fa_center)
draw_text(x,y+baseRadius+gameModeTextY,tradeMarkText)
draw_set_color(merge_color(c_black,c_gray,.3))
draw_set_font(font_freefall)
draw_set_halign(fa_center)
draw_text(x,y+baseRadius+gameModeTextY-1,tradeMarkText)
draw_set_alpha(1)*/

var inscriptionAlpha = .4
draw_set_color(c_white)
draw_set_alpha(inscriptionAlpha)
draw_set_font(font_freefall)
draw_set_halign(fa_center)
draw_text(x,y+baseRadius+gameModeTextY,tradeMarkText)

if gameModeCurrent == gameModeType.PRACTICE {
	draw_set_color(c_white)
	draw_set_alpha(inscriptionAlpha)
	draw_set_font(font_silkscreen)
	draw_set_halign(fa_center)
	var xOffset = -10
	var yOffset = 0
	draw_text(x+xOffset,y+baseRadius+gameModeTextY+16,"Ascension cleared:")
	
	var amount = 1+data.difficultyLevel
	var levelText = 0
	repeat(amount) {
		draw_sprite(spr_tiny_checkbox,sign(levelText),x+66+xOffset,y+baseRadius+gameModeTextY+19+12*levelText)
		draw_text(x+56+xOffset,y+baseRadius+gameModeTextY+16+12*levelText,amount-levelText)
		yOffset += 8
		levelText++
	}
	draw_set_alpha(1)
} else {
	/*
	gpu_set_blendmode(bm_eq_add)
	draw_sprite_ext(spr_light,0,x,y+baseRadius+gameModeTextY+18,.7,.2,0,c_aqua,.2)
	gpu_set_blendmode(bm_normal)
	
	*/
	draw_set_color(c_white)
	draw_set_alpha(inscriptionAlpha)
	draw_set_font(font_silkscreen)
	draw_set_halign(fa_center)
	draw_text(x,y+baseRadius+gameModeTextY+16,"Ascension level: ")
	draw_text(x+46,y+baseRadius+gameModeTextY+16,data.difficultyLevelSelected)
	draw_set_alpha(1)
}




if global.debugMode {
	draw_set_alpha(.1)
	draw_point(x,y)
	var flip = 1
	
	repeat(2) { // draws right side, flips to draw left
		
		// sloped area of arena
		draw_set_color(c_red)
		draw_line(x,y,x+baseWidth*flip,y)
		draw_point(x+baseWidth*flip,y)
	
		draw_point(x+baseWidth*flip,y-baseRadius)
		draw_line(x,y+baseRadius,x+baseWidth*flip,y+baseRadius)
		draw_line(x,y-baseRadius,x+baseWidth*flip,y-baseRadius)
		draw_point(x+baseWidth*flip,y+baseRadius)
		draw_point(x+baseWidth*flip+baseRadius*flip,y)
		draw_line(x+baseWidth*flip,y+baseRadius,x+baseWidth*flip+baseRadius*flip,y)
		draw_line(x+baseWidth*flip,y-baseRadius,x+baseWidth*flip+baseRadius*flip,y)
		
		draw_set_color(c_blue)
		draw_rectangle(x,y-baseRadius,x+baseWidth*flip,y+baseRadius,false)
		draw_circle(x+baseWidth*flip,y,baseRadius,false)
		
		// flat area of arena
		draw_set_color(c_red)
		draw_rectangle(x,y-flatRadius,x+baseWidth*flip,y+flatRadius,false)
		draw_circle(x+baseWidth*flip,y,flatRadius,false)
		
		// mirror drawing
		flip *= -1;
		
	}

	draw_set_alpha(1)
	draw_point(x,y)
	draw_circle(x,y,20,true)
}