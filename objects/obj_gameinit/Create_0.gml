//ROOM INSTANTIATION ORDER
var arenaX = view_wport[0] / 2
var arenaY = view_hport[0] / 2

random_set_seed(1) //set the seed to randomize gameplay

arena = instance_create_layer(arenaX,arenaY,layer,obj_arena)
camera = instance_create_layer(arena.x,arena.y,layer,obj_cam)
player = instance_create_layer(arena.x,arena.y,layer,obj_player)
gui = instance_create_layer(x,y,layer,obj_gui)
waveDirector = instance_create_layer(x,y,layer,obj_wave_director)