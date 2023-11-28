event_inherited()

draw_set_alpha(.1)
draw_point(x,y)
var flip = 1;
	
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