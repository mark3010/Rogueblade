
//ARENA VARIABLES
// flatWidth and flatRadius are the area of the arena which is flat, 
// and hence will aply no force to blades.
// force applied to blades scale from flatDist to totalDist
gameMode = -1
tradeMarkText = "GNKI ENTMT"
gameModeText = "-1"
gameModeTextY = 6
gameModeCurrent = noone
data = obj_file_handler.getProgress()

colFlat = merge_color($66564D,c_white,.25)
colSlant1 = merge_color($66564D,c_white,.22)
colSlant2 = merge_color($66564D,c_white,.17)
colSlant3 = merge_color($66564D,c_white,.11)
colSlant4 = merge_color($66564D,c_white,.05)
colSides = #434F60//#56657A//#3A4351
colSidesBot = #0E1014


zPosition = 0

arenas = {
	normal : {
		flatWidth	: 80,
		flatRadius	: 80,
		baseWidth	: 80 +130,//+ 130,
		baseRadius	: 80 +120//+ 130
	},
	practice : {
		flatWidth	: 30,
		flatRadius	: 30,
		baseWidth	: 30 + 60,
		baseRadius	: 30 + 60
	}
	
}

//WATER LAYER - EXPERIMENTAL -
//layerWater = layer_create(-999,"lay_water")
//instance_create_layer(x,y+200,layerWater,obj_water)

function init(gameMode) {
	//var data = obj_file_handler.getProgress()
	switch (gameMode) {
		case gameModeType.NORMAL:
			flatWidth	= arenas.normal.flatWidth
			flatRadius	= arenas.normal.flatRadius
			baseWidth	= arenas.normal.baseWidth
			baseRadius	= arenas.normal.baseRadius
			zPosition = - baseRadius -2
			gameModeCurrent = gameModeType.NORMAL
			gameModeText = "SURVIVAL"
		break
		case gameModeType.PRACTICE:
			flatWidth	= arenas.practice.flatWidth
			flatRadius	= arenas.practice.flatRadius
			baseWidth	= arenas.practice.baseWidth
			baseRadius	= arenas.practice.baseRadius
			zPosition = - baseRadius -2
			gameModeCurrent = gameModeType.PRACTICE
			gameModeText = "PRACTICE"
		break
	}

}

function draw_light() {
	if gameModeCurrent == gameModeType.NORMAL {
		//draw_sprite_ext(spr_light,0,x,y+baseRadius+gameModeTextY+18,1,.5,0,c_white,.7)
	}
}

event_inherited()

function draw_me(bullshit1,bullshit2,bullshit3) {
	//
	//shader_set(shd_tint)

	draw_set_alpha(1)
	// z-depth of arena

	draw_rectangle_color(x-baseWidth-baseRadius,y,x+baseWidth+baseRadius,y+820,colSidesBot,colSidesBot,colSidesBot,colSidesBot,false)
	draw_rectangle_color(x-baseWidth-baseRadius,y,x+baseWidth+baseRadius,y+180+baseRadius*1,colSides,colSides,colSidesBot,colSidesBot,false)

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
	
	draw_set_color(c_white)
	draw_set_alpha(.8)
	draw_set_font(font_silver)
	draw_set_halign(fa_center)
	draw_text(x,y,"base radius"+string(baseRadius))
	draw_text(x,y+10,"base width"+string(baseWidth))
	draw_text(x,y+20,"flat radius"+string(flatRadius))
	draw_text(x,y+30,"flat width"+string(flatWidth))


	draw_set_alpha(1)



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
		draw_text(x+xOffset,y+baseRadius+gameModeTextY+16+yOffset,"Career Level: "+string(data.accountLevel))
		yOffset += 8
		draw_text(x+xOffset,y+baseRadius+gameModeTextY+16+yOffset,"Ascension cleared:")
	
		var amount = data.difficultyLevel
		var levelText = 0
		repeat(amount+1) {
			draw_sprite(spr_tiny_checkbox,sign(levelText),x+66+xOffset,y+baseRadius+gameModeTextY+19+12*levelText+yOffset)
			draw_text(x+56+xOffset,y+baseRadius+gameModeTextY+16+12*levelText+yOffset,amount-levelText)
			//yOffset += 8
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

	//shader_reset()


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
}