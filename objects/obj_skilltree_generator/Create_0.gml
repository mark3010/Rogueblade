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
skillDescription = "missing"
//PLAYER SKILL TREE
//adding skills to skilltree

#region DAMAGE LINE
variable_struct_set(skillTree,"HeavyArtillery",
{
position: [-40,0],
name:"Heavy Artillery",
description:"adds bullet damage but reduces shot speed",
sprite: spr_passive_skills_HighCaliber,
level: 0,
parents: [],
stats: {maxTriggers : 1}
}) 

variable_struct_set(skillTree,"CannonBarrel",
{
position: [-80,15],
name:"Cannon Barrel",
description:"Increases attack size",
sprite: spr_passive_skills_CannonBarrel,
level: 0,
parents: ["HeavyArtillery"],
stats: {}
})

variable_struct_set(skillTree,"Annihilation",
{
position: [-120,15],
name:"Annihilation",
description:"increases attack size and damage, reduces attack speed",
sprite: spr_passive_skills_Annihilation,
level: 0,
parents: ["CannonBarrel"],
stats: {}
}) 

variable_struct_set(skillTree,"SplitShot",
{
position: [-80,-15],
name:"Split Shot",
description:"attacks shoot additional bullet, but deals reduced damage",
sprite: spr_passive_skills_SplitShot,
level: 0,
parents: ["HeavyArtillery"],
stats: {}
})

variable_struct_set(skillTree,"TripleShot",
{
position: [-120,-15],
name:"TripleShot",
description:"attacks shoot additional bullet, but deals reduced damage and has reduced bullet speed",
sprite: spr_passive_skills_TripleShot,
level: 0,
parents: ["SplitShot"],
stats: {}
})

variable_struct_set(skillTree,"Synkarion",
{
position: [-160,0],
name:"Synkarion",
description:"Attacks can only shoot one bullet. Damage and size is increased per additional bullet",
sprite: spr_passive_skills_Synkarion,
level: 0,
parents: ["TripleShot"],
stats: {}
})

variable_struct_set(skillTree,"Mitosis",
{
position: [-160,-30],
name:"Mitosis",
description:"Doubles projectiles, reduces damage",
sprite: spr_passive_skills_Mitosis,
level: 0,
parents: ["TripleShot"],
stats: {}
})

#endregion

#region ATTACK MODIFICATION LINE
variable_struct_set(skillTree,"AimBot",
{
position: [-30,-30],
name:"Aim Bot",
description:"Increases Accuracy",
sprite: spr_passive_skills_Aimbot,
level: 0,
parents: [],
stats: {}
})
variable_struct_set(skillTree,"FireMod",
{
position: [-45,-70],
name:"Fire Mod",
description:"Adds chance to proc fire on hit",
sprite: spr_passive_skills_FireMod,
level: 0,
parents: ["AimBot"],
stats: {}
})
variable_struct_set(skillTree,"FireModBoost",
{
position: [-45,-110],
name:"Fire Mod Boost",
description:"Increases chance to proc fire on hit",
sprite: spr_passive_skills_FireModBoost,
level: 0,
parents: ["FireMod"],
stats: {}
})
variable_struct_set(skillTree,"HeatSeeker1",
{
position: [-70,-45],
name:"Heat Seeker 1",
description:"Bullets will curve towards enemies",
sprite: spr_passive_skills_HeatSeeker1,
level: 0,
parents: ["AimBot"],
stats: {}
}) 
variable_struct_set(skillTree,"HeatSeeker2",
{
position: [-110,-45],
name:"Heat Seeker 2",
description:"Bullets will curve towards enemies more",
sprite: spr_passive_skills_HeatSeeker2,
level: 0,
parents: ["HeatSeeker1"],
stats: {}
}) 
#endregion

#region ATTACK RATE LINE
variable_struct_set(skillTree,"FireRate1",
{
position: [0,-40],
name:"Fire Rate Mk. 1",
description:"Increases firerate",
sprite: spr_passive_skills_FireRate1,
level: 0,
parents: [],
stats: {}
})

variable_struct_set(skillTree,"FireRate2",
{
position: [-15,-80],
name:"Fire Rate Mk. 2",
description:"Increases firerate further",
sprite: spr_passive_skills_FireRate2,
level: 0,
parents: ["FireRate1"],
stats: {}
}) 

variable_struct_set(skillTree,"ExplosionMod",
{
position: [-15,-120],
name:"Explosion Mod",
description:"Adds a chance for bullets to proc an explosion",
sprite: spr_passive_skills_ExplosionMod,
level: 0,
parents: ["FireRate2"],
stats: {}
})
variable_struct_set(skillTree,"ExplosionModBoost",
{
position: [-15,-160],
name:"Explosion Mod",
description:"Increases chance for bullets to proc an explosion",
sprite: spr_passive_skills_ExplosionModBoost,
level: 0,
parents: ["ExplosionMod"],
stats: {}
})
variable_struct_set(skillTree,"BulletSpeed1",
{
position: [15,-80],
name:"Bullet Velocity 1",
description:"Increases bullet speed",
sprite: spr_passive_skills_ProjectileSpeed1,
level: 0,
parents: ["FireRate1"],
stats: {}
})

variable_struct_set(skillTree,"BulletSpeed2",
{
position: [15,-120],
name:"Bullet Velocity 2",
description:"Increases bullet speed further",
sprite: spr_passive_skills_ProjectileSpeed2,
level: 0,
parents: ["BulletSpeed1"],
stats: {}
})

variable_struct_set(skillTree,"BulletPiercing1",
{
position: [30,-160],
name:"Bullet Piercing 1",
description:"Bullets will pierce one additional time",
sprite: spr_passive_skills_ArmorPenetration1,
level: 0,
parents: ["BulletSpeed2"],
stats: {}
})
#endregion

#region SPEED LINE
variable_struct_set(skillTree,"Acceleration1",
{
position: [30,-30],
name:"Improved Acceleration 1",
description:"Increases blade acceleration",
sprite: spr_passive_skills_Acceleration1,
level: 0,
parents: [],
stats: {}
})
variable_struct_set(skillTree,"Acceleration2",
{
position: [45,-70],
name:"Improved Acceleration 2",
description:"Increases blade acceleration further",
sprite: spr_passive_skills_Acceleration2,
level: 0,
parents: ["Acceleration1"],
stats: {}
})
variable_struct_set(skillTree,"MomentumEngine",
{
position: [70,-45],
name:"Momentum Engine",
description:"Damage is increased by current blade speed",
sprite: spr_passive_skills_MomentumConversion,
level: 0,
parents: ["Acceleration1"],
stats: {}
})
variable_struct_set(skillTree,"BumperPlated",
{
position: [110,-65],
name:"Bumper Plated",
description:"increases knockback power",
sprite: spr_passive_skills_BumperPlated,
level: 0,
parents: ["MomentumEngine"],
stats: {}
})
variable_struct_set(skillTree,"HollowPoints1",
{
position: [90,-85],
name:"Hollow Point Ammunition 1",
description:"Bullets have increased knockback power",
sprite: spr_passive_skills_HollowPointAmmunition1,
level: 0,
parents: ["MomentumEngine"],
stats: {}
})
variable_struct_set(skillTree,"HollowPoints2",
{
position: [120,-115],
name:"Hollow Point Ammunition 2",
description:"Bullets have further increased knockback power",
sprite: spr_passive_skills_HollowPointAmmunition2,
level: 0,
parents: ["HollowPoints1"],
stats: {}
}) 
#endregion

#region LIFE LINE
variable_struct_set(skillTree,"ReinforcedHull",
{
position: [40,0],
name:"Reinforced Hull",
description:"Increases life",
sprite: spr_passive_skills_ReinforcedHull,
level: 0,
parents: [],
stats: {}
}) 

variable_struct_set(skillTree,"Tank",
{
position: [80,0],
name:"Tank",
description:"Increases life",
sprite: spr_passive_skills_Tank,
level: 0,
parents: ["ReinforcedHull"],
stats: {}
})

variable_struct_set(skillTree,"WeightedHull",
{
position: [120,15],
name:"Weighted Hull",
description:"Greater Knock up resistance, greater knockback resistance",
sprite: spr_passive_skills_WeightedHull,
level: 0,
parents: ["Tank"],
stats: {}
})

variable_struct_set(skillTree,"HullInfusion",
{
position: [120,-15],
name:"Hull Infusion",
description:"You have no shield, greatly increases life",
sprite: spr_passive_skills_HullInfusion,
level: 0,
parents: ["Tank"],
stats: {}
})
#endregion

#region RECOVERY LINE
variable_struct_set(skillTree,"Recovery1",
{
position: [30,30],
name:"Improved Recovery 1",
description:"Improves life and shield recovery",
sprite: spr_passive_skills_RecoveryNanites,
level: 0,
parents: [],
stats: {}
})

variable_struct_set(skillTree,"Recovery2",
{
position: [70,45],
name:"Improved Recovery 2",
description:"Improves life and shield recovery further",
sprite: spr_passive_skills_NaniteOverflow,
level: 0,
parents: ["Recovery1"],
stats: {}
}) 

variable_struct_set(skillTree,"FourLeafClover",
{
position: [110,60],
name:"Four Leaf Clover",
description:"improves proc rate",
sprite: spr_passive_skills_FourLeafClover,
level: 0,
parents: ["Recovery2"],
stats: {}
}) 

variable_struct_set(skillTree,"GuardianAngel",
{
position: [45,70],
name:"Guardian Angel",
description:"faster recovery of DQ save",
sprite: spr_passive_skills_GuardianAngel,
level: 0,
parents: ["Recovery1"],
stats: {}
}) 

variable_struct_set(skillTree,"LeechLife",
{
position: [45,110],
name:"Life Stealer",
description:"Leech life on kill",
sprite: spr_passive_skills_LifeStealer,
level: 0,
parents: ["GuardianAngel"],
stats: {}
}) 

variable_struct_set(skillTree,"LeechShield",
{
position: [75,100],
name:"Energy Stealer",
description:"Leech life on kill",
sprite: spr_passive_skills_EnergyStealer,
level: 0,
parents: ["GuardianAngel"],
stats: {}
}) 
#endregion

#region SHIELD LINE
variable_struct_set(skillTree,"CorePower1",
{
position: [0,40],
name:"Core Power 1",
description:"Adds additional shield trigger",
sprite: spr_passive_skills_CorePower1,
level: 0,
parents: [],
stats: {maxTriggers : 1}
})

variable_struct_set(skillTree,"CorePower2",
{
position: [-15,80],
name:"Core Power 2",
description:"Adds additional shield trigger",
sprite: spr_passive_skills_CorePower2,
level: 0,
parents: ["CorePower1"],
stats: {maxTriggers : 1}
}) 

variable_struct_set(skillTree,"CoreInfusion",
{
position: [-15,120],
name:"Core Infusion",
description:"You only have 1 life, double shield triggers",
sprite: spr_passive_skills_CoreInfusion,
level: 0,
parents: ["CorePower2"],
stats: {maxTriggers : 3}
})

variable_struct_set(skillTree,"CoreRecharge1",
{
position: [15,80],
name:"Core Recharge Rate 1",
description:"Increases shield recharge speed",
sprite: spr_passive_skills_CoreRecharge1,
level: 0,
parents: ["CorePower1"],
stats: {}
})
variable_struct_set(skillTree,"CoreRecharge2",
{
position: [15,120],
name: "Core Recharge Rate 2",
description:"Increases shield recharge speed",
sprite: spr_passive_skills_CoreRecharge2,
level: 0,
parents: ["CoreRecharge1"],
stats: {}
})
variable_struct_set(skillTree,"LightningMod",
{
position: [30,160],
name: "Lightning Mod",
description:"Chance to proc lightning on hit",
sprite: spr_passive_skills_LightningMod,
level: 0,
parents: ["CoreRecharge2"],
stats: {}
})
variable_struct_set(skillTree,"LightningModBoost",
{
position: [30,200],
name: "Lightning Mod Boost",
description:"Greatly increases chance to proc lightning on hit",
sprite: spr_passive_skills_LightningModBoost,
level: 0,
parents: ["LightningMod"],
stats: {}
})
variable_struct_set(skillTree,"Masochism",
{
position: [0,160],
name: "Masochism",
description:"On shield recovery, take 1 damage. greatly increase cooldown speed",
sprite: spr_passive_skills_Masochist,
level: 0,
parents: ["CoreRecharge2"],
stats: {}
})
#endregion

////////////////////////////////////////////////////////////////////////////////////////////

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
	skillDescription = variable_struct_get(skillTree,structName).description
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