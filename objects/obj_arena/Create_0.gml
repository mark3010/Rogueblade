
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

function init(gameMode) {
	//var data = obj_file_handler.getProgress()
	show_debug_message(data)
	switch (gameMode) {
		case gameModeType.NORMAL:
			flatWidth	= arenas.normal.flatWidth
			flatRadius	= arenas.normal.flatRadius
			baseWidth	= arenas.normal.baseWidth
			baseRadius	= arenas.normal.baseRadius
			gameModeCurrent = gameModeType.NORMAL
			gameModeText = "SURVIVAL"
		break
		case gameModeType.PRACTICE:
			flatWidth	= arenas.practice.flatWidth
			flatRadius	= arenas.practice.flatRadius
			baseWidth	= arenas.practice.baseWidth
			baseRadius	= arenas.practice.baseRadius
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