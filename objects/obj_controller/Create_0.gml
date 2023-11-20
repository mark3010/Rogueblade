// DEBUG MODE
global.debugMode = -1

// RENDER VARIABLES
global.renderSize = 1

global.instanceIDCounter = 0

//ROOM INSTANTIATION ORDER

	//calculate placement
	arenaX = view_wport[0] / 2
	arenaY = view_hport[0] / 2

instance_create_layer(arenaX,arenaY,layer,obj_arena)
instance_create_layer(obj_arena.x,obj_arena.y,layer,obj_cam)
instance_create_layer(x,y,layer,obj_gui)