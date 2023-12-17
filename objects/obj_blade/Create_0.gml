scr_bladeArenaSync()

//ID
instanceId = global.instanceIDCounter++

//CONTROLS
//keybindings
global.key_up = ord("W")
global.key_down = ord("S")
global.key_right = ord("D")
global.key_left = ord("A")

//VARIABLES
//STATS
maxLife = 2
lifeRegen = 0
maxTriggers = 0
velMax = 6				//max speed before drag is applied
dragStrength = 0.1		// [1..0] where 1 is maximum drag effect, 0.1 allows ~50% speed increase

//STATS CALCULATIONS
currentLife = maxLife
currentTriggers = maxTriggers

maxTriggersCooldown = 60*4 //seconds 
currentTriggersCooldown = 0 //seconds 
triggersCooldownRegen = 1

vel = [0,0]
velVector = 0
dragVector = 0
velXSurplus = 0
velYSurplus = 0

//ANIMATION
slantH = 0
slantV = 0
hitFlash = 0
lifetime = 0

shd_texel_handle = shader_get_uniform(shd_outline,"in_Texel")

//OTHER
#macro X 0
#macro Y 1

//TEAM
enum TEAM {
	ALLY,
	ENEMY
}

team = TEAM.ENEMY

//LIFE AND DEATH
function die() {
	audio_play_sound(snd_death, 11, false)
	if team = TEAM.ENEMY && instance_exists(obj_player) {
		obj_player.EXP++
	}
	ds_map_destroy(cooldownMap)
	instance_destroy()
}

//DAMAGE CALCULATIONS
enum DAMAGE_TYPE {
	HEALTH,
	SHIELD
}

hitFlashType = DAMAGE_TYPE.HEALTH

function takeDamage(damage) {
	if currentTriggers > 0 {
		currentTriggers--
		hitFlashType = DAMAGE_TYPE.SHIELD
	} else {
		currentLife -= damage
		hitFlashType = DAMAGE_TYPE.HEALTH
	}
	
	currentTriggersCooldown = 0
}

//COOLDOWN CALCULATIONS
cooldownMap = ds_map_create()

function cooldownInstanceAdd(map, instanceId, cooldownValue) {
	ds_map_add(map, instanceId, cooldownValue)
}

function cooldownInstanceExists(instanceId) {
	return ds_map_find_value(cooldownMap,instanceId)
}

function cooldownsCalculate() {
	for (var k = ds_map_find_first(cooldownMap); !is_undefined(k); k = ds_map_find_next(cooldownMap, k)) {
		cooldownMap[? k] -= 1;
		if cooldownMap[? k] == 0 {
			ds_map_delete(cooldownMap,k)
		}
	}
}

//DEBUG
instance_create_depth(x,y,depth,obj_spawn_point_debug)