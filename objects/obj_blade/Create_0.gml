//CONTROLS
//keybindings
global.key_up = ord("W")
global.key_down = ord("S")
global.key_right = ord("D")
global.key_left = ord("A")

//VARIABLES
#macro X 0
#macro Y 1
vel = [0,0]
velVector = 0
dragVector = 0
velXSurplus = 0
velYSurplus = 0
cooldown = 0
//stats
velMax = 6				//max speed before drag is applied
dragStrength = 0.1		// [1..0] where 1 is maximum drag effect, 0.1 allows ~50% speed increase



//ANIMATION
slantH = 0
slantV = 0