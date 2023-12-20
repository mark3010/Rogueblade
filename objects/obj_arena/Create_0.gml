
//ARENA VARIABLES
// flatWidth and flatRadius are the area of the arena which is flat, 
// and hence will aply no force to blades.
// force applied to blades scale from flatDist to totalDist

arenas = {
	normal : {
		flatWidth	: 80,
		flatRadius	: 80,
		baseWidth	: 80 + 160,
		baseRadius	: 80 + 160
	},
	practice : {
		flatWidth	: 30,
		flatRadius	: 30,
		baseWidth	: 30 + 60,
		baseRadius	: 30 + 60
	}
	
}

function init(gameMode) {
	switch (gameMode) {
		case gameModeType.NORMAL:
			flatWidth	= arenas.normal.flatWidth
			flatRadius	= arenas.normal.flatRadius
			baseWidth	= arenas.normal.baseWidth
			baseRadius	= arenas.normal.baseRadius
		break
		case gameModeType.PRACTICE:
			flatWidth	= arenas.practice.flatWidth
			flatRadius	= arenas.practice.flatRadius
			baseWidth	= arenas.practice.baseWidth
			baseRadius	= arenas.practice.baseRadius
		break
	}

}


depth = 9