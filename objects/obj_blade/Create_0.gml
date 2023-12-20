scr_bladeArenaSync()

//ID
instanceId = global.instanceIDCounter++

#region ENUMS

enum TEAM {
	ALLY,
	ENEMY
}

enum DAMAGE_TYPE {
	HEALTH,
	SHIELD
}

#endregion

//CONTROLS
//keybindings
global.key_up = ord("W")
global.key_down = ord("S")
global.key_right = ord("D")
global.key_left = ord("A")

#region STATS
stats = {
	maxLife : 2,
	lifeRegen : 0,
	maxTriggers : 0,
	velMax : 6,		//max speed before drag is applied
	maxTriggersCooldown : 60*4, //seconds 
	triggersCooldownRegen : 1
}

function lifeCalculate() {
	currentLife += stats.lifeRegen/60

	if currentLife > stats.maxLife {
		currentLife = stats.maxLife
	}
}

function triggersCalculate() {
	if currentTriggers < stats.maxTriggers {
		currentTriggersCooldown += stats.triggersCooldownRegen
	}

	if currentTriggersCooldown >= stats.maxTriggersCooldown {
		currentTriggers = stats.maxTriggers
		currentTriggersCooldown = 0
		audio_play_sound(snd_shield_full, 5, false)
		var shieldRegainedAnim = instance_create_depth(x,y,depth+100,obj_shield_regained) 
		shieldRegainedAnim.target = id
	}
}

//UPDATE CURRENTS
function refreshCurrents() {
	currentLife = stats.maxLife
	currentTriggers = stats.maxTriggers
	currentTriggersCooldown = 0 //seconds 
}
#endregion

refreshCurrents()

#region KINETICS

dragStrength = 0.1		// [1..0] where 1 is maximum drag effect, 0.1 allows ~50% speed increase
vel = [0,0]
velVector = 0
dragVector = 0
velXSurplus = 0
velYSurplus = 0

#endregion

#region ANIMATION VARIABLES

slantH = 0
slantV = 0
hitFlash = 0
lifetime = 0
shd_texel_handle = shader_get_uniform(shd_outline,"in_Texel")
hitFlashType = DAMAGE_TYPE.HEALTH

#endregion

#region OTHER

team = TEAM.ENEMY

deathFlag = false
#macro X 0
#macro Y 1

#endregion

#region COMBAT

//LIFE AND DEATH
function die() {
	audio_play_sound(snd_death, 11, false)
	if team = TEAM.ENEMY && instance_exists(obj_player) {
		obj_player.EXP++
	}
	
	deathFlag = true
}

function takeDamage(damage) {
	if currentTriggers > 0 {
		currentTriggers--
		hitFlashType = DAMAGE_TYPE.SHIELD
	} else {
		currentLife -= damage
		hitFlashType = DAMAGE_TYPE.HEALTH
		
		if currentLife <= 0 {
			die()
		}
	}
	
	currentTriggersCooldown = 0
}

#endregion

#region COLLISION DETECTION
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
#endregion

//DEBUG
if global.debugMode {instance_create_depth(x,y,depth,obj_spawn_point_debug)}