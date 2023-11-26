enum waveType {
	ALL,
	HORIZONTAL,
	VERTICAL,
	TOP,
	BOT,
	LEFT,
	RIGHT,
	total
}

enum waveSpawnerType {
	HORIZONTAL,
	VERTICAL
}

//[timer,totalTimer,waves,enemies,name]
var arena = obj_arena

//flatWidth	= 60;
//flatRadius	= 60;

//baseWidth	= flatWidth  + 160;
//baseRadius	= flatRadius + 160;

spawnerList = []

//SPAWNERS
//top
var arenaTopX = arena.x
var arenaTopY = arena.y - arena.baseWidth
top = instance_create_layer(arenaTopX,arenaTopY,layer,obj_wave_spawner_horisontal)
top.image_xscale = (arena.baseWidth + arena.baseRadius)  / 16 * 2
top.image_yscale = 1
array_insert(spawnerList,0,top)

//bot
var arenaBottomX = arena.x
var arenaBottomY = arena.y + arena.baseWidth
bottom = instance_create_layer(arenaBottomX,arenaBottomY,layer,obj_wave_spawner_horisontal)
bottom.image_xscale = (arena.baseWidth + arena.baseRadius)  / 16 * 2
bottom.image_yscale = 1
array_insert(spawnerList,1,bottom)

//right
var arenaRightX = arena.x + (arena.baseWidth + arena.baseRadius) 
var arenaRightY = arena.y
right = instance_create_layer(arenaRightX,arenaRightY,layer,obj_wave_spawner_vertical)
right.image_xscale = 1
right.image_yscale = arena.baseWidth / 16 * 2
array_insert(spawnerList,2,right)

//left
var arenaLeftX = arena.x - (arena.baseWidth + arena.baseRadius) 
var arenaLeftY = arena.y
left = instance_create_layer(arenaLeftX,arenaLeftY,layer,obj_wave_spawner_vertical)
left.image_xscale = 1
left.image_yscale = arena.baseWidth / 16 * 2
array_insert(spawnerList,3,left)


//instance_create_layer(x,y,layer,obj_wave_spawner)

//for (var i = 0; i < instance_number(obj_wave_spawne); ++i;)
//{
//    spawnerList[i] = instance_find(ObjMobSpawner,i);
//}

waveList = []


waveNumber = 1