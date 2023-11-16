function scr_bladeArenaSync(){
	objArena = instance_nearest(x,y,obj_arena) //
	//inits objArena
	
	scr_arenaPointVariables(objArena) // 
	// inits "arenaBaseX", "arenaFlatBorderX", "arenaSlopedBorderX" vars. Same for Y
	
	scr_bladePositionCheck(objArena,arenaBaseX,arenaBaseY,arenaFlatBorderX,arenaFlatBorderY,arenaSlopedBorderX,arenaSlopedBorderY) // 
	// inits onSlope, onBorder vars
}