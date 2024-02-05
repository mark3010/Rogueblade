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
		var shieldRegainedAnim = instance_create_layer(x,y,layer_get_id("layerGround"),obj_shield_regained) 
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
baseTiltY = 72 //0% shows no blade, 200% doubles size, 100% no change

hitFlash = 0
lifetime = 0
shd_texel_handle = shader_get_uniform(shd_outline,"in_Texel")
hitFlashType = DAMAGE_TYPE.HEALTH

renderTarget = -1
renderLayer = -1

//3d PARTS
function Model(
_pattern = spr_model_pattern,
_material = spr_model_material
) constructor {
	pattern = _pattern
	material = _material
}

anchor =	new Model(spr_anchor1_pattern,spr_anchor1_material2)
hull =		new Model(spr_hull1_pattern,spr_hull1_material2)
core =		new Model(spr_core1_pattern,spr_core1_material2)

rotationAnim = 0
function animationsCalculate() {
	rotationAnim += 4*2
}

function draw_me() {
	#region ANIMATION
	var slopeAngleStrength = 0.5 // 0 is flat arena border, 1 is vertical arena border, 0.5 is 45 degree arena border
	var slantHAnim = slantH * sign(obj_arena.x-x) * slopeAngleStrength * 90 // 90 is rotation at max slope slant
	var slantVAnim = slantV * sign(obj_arena.y-y) * slopeAngleStrength * .3 // .1 is stretch at max slope slant
	#endregion
	
	if global.renderMode {
	// DRAW_ME V1

	if lifetime < 1 {exit}
	
	#region DRAW SHADOW
	var shadowX = x -(obj_arena.x - x) * 0.03
	var shadowY = y -(obj_arena.y - y) * 0.03
	draw_sprite_ext(spr_blade_base_shadow,0,shadowX,shadowY,1,1+slantVAnim,0-slantHAnim,c_white,.1) // draw self
	#endregion
	
	#region DRAW SELF
	shader_set(shd_outline)

	var texture = sprite_get_texture(sprite_index, image_index)
	var t_width = texture_get_texel_width(texture)
	var t_height = texture_get_texel_height(texture)

	shader_set_uniform_f(shd_texel_handle,t_width,t_height)

	draw_sprite_ext(sprite_index,0,x,y,1,1+slantVAnim,0-slantHAnim,c_white,1) // draw self
	draw_sprite_ext(sprite_index,hitFlashType+1,x,y,1,1+slantVAnim,0-slantHAnim,c_white,hitFlash) // draw hitflash

	shader_reset()

	#endregion
	} else {
	//DRAW_ME V2
	#region ANIMATION
	
	layerNumber = 0
	
	if (!surface_exists(renderTarget)) { 
	    renderTarget = surface_create(32*3,32*3)
	}
	
	if (!surface_exists(renderLayer)) { 
		renderLayer = surface_create(32,32)
	}
	
	#region DRAW SHADOW
	var shadowX = x -(obj_arena.x - x) * 0.03
	var shadowY = y -(obj_arena.y - y) * 0.03
	
	var yTiltSkew = 1 - (1 - baseTiltY/100) + slantVAnim
	var xTiltSkew = 1
	
	draw_sprite_ext(spr_blade_base_shadow,0,shadowX,shadowY,xTiltSkew,yTiltSkew,0,c_white,.1) // draw self
	//scr_render3d_shadow(spr_blade_base_shadow)
	
	#endregion
	
	//generate model to target surface
	if anchor != -1		{scr_render3d(anchor,renderTarget,renderLayer)}
	if hull != -1		{scr_render3d(hull,renderTarget,renderLayer)}
	if core != -1		{scr_render3d(core,renderTarget,renderLayer)}
	
	//render settings for blade
	shader_set(shd_outline)
	
	var texture = surface_get_texture(renderTarget)
	var t_width = texture_get_texel_width(texture)
	var t_height = texture_get_texel_height(texture)

	shader_set_uniform_f(shd_texel_handle,t_width,t_height)
	
	//var targetXOffset = surface_get_width(renderTarget)/2 +1
	//var targetYOffset = surface_get_height(renderTarget)/2 -3
	
	//render anchor point settings for surface
	var wm = matrix_get(matrix_world);          // Store this here, restore it later
	matrix_set(matrix_world, matrix_build(
	    x, y, 0,
	    0, 0, -slantHAnim,
	    1, 1, 1
	))
	
	//render blade
	//draw_surface_ext(renderTarget,x-targetXOffset,y-targetYOffset,1,1,-slantHAnim,c_white,1)
	draw_surface_ext(renderTarget,-surface_get_width(renderTarget)/2,-surface_get_height(renderTarget)/2,1,1,0,c_white,1)
	
	//draw_circle(xstart, ystart, 20, true);
	matrix_set(matrix_world, wm)
	shader_reset()
	
	//wipe surfaces
	
	surface_set_target(renderTarget)
	draw_clear_alpha(c_white,0)
	if global.debugMode draw_clear_alpha(c_red,.2)
	surface_reset_target()

	surface_set_target(renderLayer)
	draw_clear_alpha(c_white,0)
	surface_reset_target()
	
	#endregion
	}
}

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
if global.debugMode {instance_create_layer(x,y,layer,obj_spawn_point_debug)}