function scr_arenaPointVariables(argument0){
//GLOBAL BOTTOM POINT CALC FOR ARENA
	arenaBaseX = clamp(x,argument0.x-argument0.baseWidth,argument0.x+argument0.baseWidth) // point of shortest dist to blade
	arenaBaseY = argument0.y															  // point of shortest dist to blade
	//circle params from shortest point
	var dir = point_direction(x,y,arenaBaseX,arenaBaseY)
	
//FLAT ARENA BORDER CALCULATION
	//clamp position to flatArea
	var distance = clamp(point_distance(arenaBaseX, arenaBaseY, x, y), 0, argument0.flatRadius);
	arenaFlatBorderX = arenaBaseX - lengthdir_x(distance, dir);
	arenaFlatBorderY = arenaBaseY - lengthdir_y(distance, dir);

//SLOPED ARENA BORDER CALCULATION
	//clamp position to flatArea
	var distance = clamp(point_distance(arenaBaseX, arenaBaseY, x, y), 0, argument0.baseRadius);
	arenaSlopedBorderX = arenaBaseX - lengthdir_x(distance, dir);
	arenaSlopedBorderY = arenaBaseY - lengthdir_y(distance, dir);
}