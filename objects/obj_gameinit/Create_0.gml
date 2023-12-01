//ROOM INSTANTIATION ORDER
var arenaX = view_wport[0] / 2
var arenaY = view_hport[0] / 2

randomize() //set the seed to randomize gameplay

arena = instance_create_depth(arenaX,arenaY,depth,obj_arena)
camera = instance_create_depth(arena.x,arena.y,depth,obj_cam)
player = instance_create_depth(arena.x,arena.y,depth,obj_player)
gui = instance_create_depth(x,y,depth,obj_gui)
waveDirector = instance_create_depth(x,y,depth,obj_wave_director)
timer = instance_create_depth(x,y,depth,obj_timer)