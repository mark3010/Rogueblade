pages = ["lay_menu0","lay_menu1","lay_menu2_1","lay_menu2_2","lay_menu2_1_1","lay_menu2_1_2","lay_menu2_1_3","lay_menu999"]
if global.gameFirstLoad {
	init("lay_menu0")
	global.gameFirstLoad = false
} else {
	init("lay_menu1")
}
