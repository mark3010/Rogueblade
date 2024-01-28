event_inherited()

var colFlat = merge_color($66564D,c_white,.25)
var colSlant1 = merge_color($66564D,c_white,.22)
var colSlant2 = merge_color($66564D,c_white,.17)
var colSlant3 = merge_color($66564D,c_white,.11)
var colSlant4 = merge_color($66564D,c_white,.05)

// sloped area of arena
/**

var flip = 1
repeat(2) { // draws right side, flips to draw left
	draw_set_color(colSlant1)
	draw_rectangle(x,y-baseRadius,x+baseWidth*flip,y+baseRadius,false)
	draw_circle(x+baseWidth*flip,y,baseRadius,false)
	flip *= -1
}*/
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