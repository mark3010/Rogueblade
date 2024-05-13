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
position: [-120,0],
name:"Heavy Artillery",
description:"adds bullet damage but reduces shot speed",
sprite: spr_passive_skill_test,
level: 0,
parents: []
}) 

variable_struct_set(skillTree,"ExplosiveRounds",
{
position: [-240,60],
name:"Explosive Rounds",
description:"bullets explode",
sprite: spr_passive_skill_test,
level: 0,
parents: ["HeavyArtillery"]
}) 

variable_struct_set(skillTree,"ShotCaller",
{
position: [-240,-60],
name:"Shot Caller",
description:"something something",
sprite: spr_passive_skill_test,
level: 0,
parents: ["HeavyArtillery"]
}) 

variable_struct_set(skillTree,"EnhancedBooster",
{
position: [120,0],
name:"Enhanced Booster",
description:"more daashesss",
sprite: spr_passive_skill_test,
level: 0,
parents: []
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
		_i.sprite_index = _skill.sprite
		_i.baseXOffset = _skill.position[X]
		_i.baseYOffset = _skill.position[Y]
		_i.level = _skill.level
		_i.description = _skill.description
		_i.parents = _skill.parents
    }
}

skillTreeSurfSize = [2000,2000]
skillTreeSurf = surface_create(skillTreeSurfSize[X],skillTreeSurfSize[Y]);

generateSkillTree(skillTree)

//ANIMATION VARIABLES
//pan
interpolateFill = [0,0]
interpolateFillTarget = [0,0]
interpolateFillStart = [0,0]

interpolateCurveStruct = animcurve_get(AC_EaseOut)
interpolateChannel = animcurve_get_channel(interpolateCurveStruct,0)

interpolateCurvePosition = 0
interpolateCurveSpeed = 0.05

//zoom
//ANIMATION VARIABLES
interpolateZoomFill = 0
interpolateZoomFillTarget = 1
interpolateZoomFillStart = 0

interpolateZoomCurveStruct = animcurve_get(AC_EaseOut)
interpolateZoomChannel = animcurve_get_channel(interpolateZoomCurveStruct,0)

interpolateZoomCurvePosition = 0
interpolateZoomCurveSpeed = 0.05