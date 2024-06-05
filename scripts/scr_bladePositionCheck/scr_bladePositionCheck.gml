// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bladePositionCheck(argument0,argument1,argument2,argument3,argument4,argument5,argument6){
	
	//check if blade on slope
	if point_distance(argument3,argument4,argument5,argument6) > 0 {
		onSlope = true
	} else {
		onSlope = false
	}
	
	//check if blade on arena border
	if (point_distance(argument1,argument2,argument5,argument6) + 1 >= argument0.baseRadius) {
		onBorder = true
	} else {
		onBorder = false
	}
	
	//check if blade on arena border
	if (point_distance(argument1,argument2,argument5,argument6) + 1 > argument0.baseRadius) {
		outOfBounds = true
	} else {
		outOfBounds = false
	}
}