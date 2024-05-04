scr_bladeArenaSync()

//ID
instanceId = global.instanceIDCounter++
groupId = -1

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

#region STATS
stats = {
	//resources
	maxLife : 3,
	lifeRegen : 0,
	maxTriggers : 0,
	//movement
	deflectionPower : 100,
	deflectionResistance : 100,
	velMax : 4,					//VELOCITY - max speed before drag is applied
	maxTriggersCooldown : 240,	//SECONDS 
	triggersCooldownRegen : 1,	
	zGravity : 40,				//PIXELS/SECOND
	zBounciness : 50,			//PERCENTAGE - 100% means bounce with no loss, 0% means no bouncy at all
	acc : 0.2,					//PIXEL/TICK - acceleration
	//weapon
	attacksPerSecond : 3,
	recoil :	.6				//measured in 1/100 of velocity
}

attackCooldown = 0

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
vel = [0,0,0]			// holds current velocity
velAdd = [0,0,0]		// holds temporary vector to add to velocity 
zPosition = 110 + irandom(20)

//add some spawn z speed
vel[Z] = 2+irandom(10)/10

velVector = 0
dragVector = 0
velXSurplus = 0
velYSurplus = 0
onGround = false

//natural spawn velocity
var arenaFind = instance_nearest(x,y,obj_arena)
var dir = point_direction(x,y,arenaFind.x,arenaFind.y)
var spawnVelocity = min( point_distance(x,y,arenaFind.x,arenaFind.y), 5 ) / 5

function addVelocity(velocity,velDirection) {
	vel[@ X] = lengthdir_x(velocity, velDirection)
	vel[@ Y] = lengthdir_y(velocity, velDirection)
}

addVelocity(spawnVelocity,dir)

#endregion

#region ANIMATION VARIABLES

//tweakable
slopeAngleStrengthY = 1.3		//tilt effect, higher => more tilt
slopeAngleStrengthX = 1.3		//tilt effect, higher => more tilt
baseTiltY = 1.5					//higher than 0 means more tilted towards north, 
rotationBaseSpeed = 8			//base animation speed for rotating blade
hitDistortionStrength = .25
spawnAnim = 8 // used for white recolor at spawn, when 0 blade is 0% white

// other
slantH = 0
slantV = 0
animationTilt = [0,0] // variable that controls blade animation tilt axis 
animationTiltMovement = [0,0]
animationTiltArena = [0,0]
rotationAnim = 0
hitDistortion = 0
hitDistortionDirection = 0

function animationsCalculate() {
	rotationAnim += rotationBaseSpeed
	
	//HORISONTAL
	animationTiltMovement[@ X] = lerp(animationTiltMovement[@ X],sign(velAdd[@ X]), stats.acc / stats.velMax)	// tilt for self acceleration
	animationTiltArena[@ X] = sqrt(slantH) * sign(obj_arena.x-x) * slopeAngleStrengthX					// tilt for arena slopes
	
	animationTilt[@ X] = animationTiltArena[@ X] + animationTiltMovement[@ X]
	
	//VERTICAL
	animationTiltMovement[@ Y] = lerp(animationTiltMovement[@ Y],sign(velAdd[@ Y]),  stats.acc / stats.velMax)		// tilt for self acceleration
	animationTiltArena[@ Y] = sqrt(slantV) * sign(obj_arena.y-y) * slopeAngleStrengthY - baseTiltY	// tilt for arena slopes									// adding some base tilt to spritestack
	
	animationTilt[@ Y] = animationTiltArena[@ Y] + animationTiltMovement[@ Y]
}

hitFlash = 0
lifetime = 0
shd_texel_handle = shader_get_uniform(shd_outline,"in_Texel")
hitFlashType = DAMAGE_TYPE.HEALTH
hitFlashColorMerge = 1

//3d PARTS
function Model(
_pattern = spr_model_pattern,
_material = spr_model_material) 
constructor {
	pattern = _pattern
	material = _material
}

anchor =	new Model(spr_anchor1_pattern,spr_anchor1_material2)
hull =		new Model(spr_hull1_pattern,spr_hull1_material2)
core =		new Model(spr_core1_pattern,spr_core1_material2)

function physicsCalculate() {
	velocity = point_distance(x,y,x+vel[X],y+vel[Y])
	dimensions = {
		zLength : sprite_get_number(anchor.material) + sprite_get_number(hull.material) + sprite_get_number(core.material)
	}
}

physicsCalculate()


function draw_me(sliceSurf, effectSurf, targetSurf) {
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
	
	#region DRAW SHADOW
	var shadowX = x -(obj_arena.x - x) * 0.03
	var shadowY = y -(obj_arena.y - y) * 0.03
	
	var yTiltSkew = ( baseTiltY / 100 + slantVAnim - 0.8) / ( 1 + zPosition / 50 )
	var xTiltSkew = 1 / ( 1 + zPosition / 30 )
	
	draw_sprite_ext(spr_blade_base_shadow,0,shadowX,shadowY,xTiltSkew,yTiltSkew,0,c_white,.1) // draw self
	//scr_render3d_shadow(spr_blade_base_shadow)
	
	#endregion
	
	var hitCol = c_teal //shield
	if hitFlashType == 0 {hitCol = merge_color(c_gray,c_maroon,hitFlashColorMerge)} //life

	//generate model to target surface
	if anchor	!= -1	{scr_render3d_v2(anchor,targetSurf,sliceSurf,effectSurf,c_white,animationTilt)}
	if hull		!= -1	{scr_render3d_hull(hull,targetSurf,sliceSurf,effectSurf,hitCol,animationTilt,hitFlash)}
	if core		!= -1	{scr_render3d_v2(core,targetSurf,sliceSurf,effectSurf,c_white,animationTilt,true)}
	
	//render settings for blade
	shader_set(shd_outline)
	
	var texture = surface_get_texture(targetSurf)
	var t_width = texture_get_texel_width(texture)
	var t_height = texture_get_texel_height(texture)

	shader_set_uniform_f(shd_texel_handle,t_width,t_height)
	
	//render anchor point settings for surface
	var wm = matrix_get(matrix_world);          // Store this here, restore it later
	matrix_set(matrix_world, matrix_build(
	    x, y+6 - zPosition , 0,
	    0, 0, -slantHAnim/1.5-animationTilt[X]*20,
	    1, 1, 1
	))
	
	//render blade
	draw_surface_ext(targetSurf,-surface_get_width(targetSurf)/2,-surface_get_height(targetSurf)/2,1,1,0,c_white,1)
	
	//white overlay for blade spawn
	if spawnAnim > 0 {
		shader_set(shd_flash)
		gpu_set_blendmode(bm_add)
		draw_surface_ext(targetSurf,-surface_get_width(targetSurf)/2,-surface_get_height(targetSurf)/2,1,1,0,c_white,spawnAnim)
		gpu_set_blendmode(bm_normal)
		shader_reset()
	}
	//reset matrix and shader
	matrix_set(matrix_world, wm)
	shader_reset()
	
	//wipe surfaces
	surface_set_target(targetSurf)
	draw_clear_alpha(c_white,0)
	surface_reset_target()

	surface_set_target(sliceSurf)
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
#macro Z 2

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

function takeDamage(damage,damageDirection,ally) {
	var damageTaken = 0
	//damage calculation
	if currentTriggers > 0 {
		
		damageTaken = damage
		
		currentTriggers--
		hitFlashType = DAMAGE_TYPE.SHIELD
		hitFlash = 1
		hitFlashColorMerge = 1
	} else {
		
		damageTaken = damage * (1-ally*.95) // .8 is same team damage resistance
		
		currentLife -= damageTaken
		hitFlashType = DAMAGE_TYPE.HEALTH
		
		hitFlash = 1
		hitFlashColorMerge = clamp((damageTaken*4)/stats.maxLife,0,1)
		if currentLife <= 0 {
			die()
		}
	}
	
	currentTriggersCooldown = 0
	
	//animation calculation
	hitDistortion = 1
	hitDistortionDirection = damageDirection
	
	//damage number
	var damageNumber = instance_create_depth(other.x,other.y-20-16,depth,obj_damage_number)
	damageNumber.damage = damageTaken
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

//spawn anim
var spawnParticle = instance_create_layer(x,y,layer,obj_death_explosion)
spawnParticle.zPosition = zPosition

//DEBUG
if global.debugMode {instance_create_layer(x,y,layer,obj_spawn_point_debug)}