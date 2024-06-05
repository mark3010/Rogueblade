/// @description Insert description here
// You can write your code in this editor
event_inherited()
image_speed = 0

baseXScale = 2
baseYScale = 2
baseX = x
baseY = y
forcedActive = false


//INIT PLAYER VARIABLES

skillTree = {}
skillPoints = 0

//PLAYER SKILL TREE
//adding skills to skilltree
variable_struct_set(skillTree,"HeavyArtillery",
{
position: [-40,0],
name:"Heavy Artillery",
description:"adds bullet damage but reduces shot speed",
sprite: spr_passive_skill_test,
level: 0,
parents: [],
stats: {maxTriggers : 1}
}) 

variable_struct_set(skillTree,"ExplosiveRounds",
{
position: [-90,20],
name:"Explosive Rounds",
description:"bullets explode",
sprite: spr_passive_skill_test,
level: 0,
parents: ["HeavyArtillery"],
stats: {maxLife : 1}
}) 

variable_struct_set(skillTree,"ShotCaller",
{
position: [-90,-20],
name:"Shot Caller",
description:"something something",
sprite: spr_passive_skill_test,
level: 0,
parents: ["HeavyArtillery"],
stats: {maxLife : 1}
}) 

variable_struct_set(skillTree,"EnhancedBooster",
{
position: [40,0],
name:"Enhanced Booster",
description:"more daashesss",
sprite: spr_passive_skill_test,
level: 0,
parents: [],
stats: {maxLife : 1}
}) 

//generate skill tree
function generateSkillTree(struct){
    var key, value;
    var keys = variable_struct_get_names(struct);
    for (var i = array_length(keys)-1; i >= 0; --i) {
		var _skillName = keys[i]
		var _skill = variable_struct_get(skillTree,_skillName)
		var _i = instance_create_layer(baseX,baseY,layer,obj_skilltree_skill)
		_i.structName = _skillName
		_i.name = _skill.name
		_i.sprite_index = _skill.sprite
		_i.baseXOffset = _skill.position[X]
		_i.baseYOffset = _skill.position[Y]
		_i.level = _skill.level
		_i.description = _skill.description
		_i.parents = _skill.parents
    }
}

skillTreeSurfSize = [960*3,540*3]
skillTreeSurf = surface_create(skillTreeSurfSize[X],skillTreeSurfSize[Y]);

generateSkillTree(skillTree)

//ANIMATION VARIABLES
//pan
function resetAnimations() {
	interpolateFill = [0,0]
	interpolateFillTarget = [0,0]
	interpolateFillStart = [0,0]

	interpolateCurveStruct = animcurve_get(AC_EaseIn2)
	interpolateChannel = animcurve_get_channel(interpolateCurveStruct,0)

	interpolateCurvePosition = 0
	interpolateCurveSpeed = 0.02

	//zoom
	//ANIMATION VARIABLES
	interpolateZoomFill = 0
	interpolateZoomFillTarget = 1
	interpolateZoomFillStart = 0

	interpolateZoomCurveStruct = animcurve_get(AC_EaseIn)
	interpolateZoomChannel = animcurve_get_channel(interpolateZoomCurveStruct,0)

	interpolateZoomCurvePosition = 0
	interpolateZoomCurveSpeed = 0.05
}

resetAnimations()

function refocus(structName) {
	_pos = variable_struct_get(skillTree,structName).position
	
	if (interpolateFillTarget != _pos) {
				
		interpolateFillStart = [array_get(interpolateFill,0),array_get(interpolateFill,1)]
		interpolateCurvePosition = 0
		interpolateFillTarget = _pos
	}
}

/*
	USE FOR SMOOTH TARGETING INTERPOLATION EFFECT
	var _pos = variable_struct_get(ObjPlayerHandler.skillTree,selected.target.structName).position
	if (ObjSkillTreeGenerator.interpolateFillTarget != _pos) {
				
		ObjSkillTreeGenerator.interpolateFillStart = [array_get(ObjSkillTreeGenerator.interpolateFill,0),array_get(ObjSkillTreeGenerator.interpolateFill,1)]
		ObjSkillTreeGenerator.interpolateCurvePosition = 0
		ObjSkillTreeGenerator.interpolateFillTarget = _pos
		selectedSkillCardFlag = true // trigger selected button function
	}