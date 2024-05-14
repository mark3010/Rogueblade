/// @description Insert description here
// You can write your code in this editor
enum BLADE_CORE {
	BLUE,
	RED,
	GREEN,
	ORANGE,
	PURPLE,
	PINK,
	YELLOW,
	LTBLUE,
	LTORANGE,
	LTYELLOW,
	LTGREEN,
	NUM
}

enum BLADE_HULL {
	BALANCE,
	HURRICANE,
	CONSTRUCT,
	BLOSSOM,
	NUM
}

enum BLADE_ANCHOR {
	PELLET,
	EXPLOSION,
	NUM
}

function Model(
_pattern = spr_model_pattern,
_material = spr_model_material) 
constructor {
	pattern = _pattern
	material = _material
}

function getPlayerSettings() {
	var data = obj_file_handler.getProgress()
	var bladePartEnumCore = data.blade.core
	var bladePartEnumHull = data.blade.hull
	var bladePartEnumAnchor = data.blade.anchor
	
	var bladeData = {
		core: getCore(bladePartEnumCore),
		hull: getHull(bladePartEnumHull),
		anchor: getAnchor(bladePartEnumAnchor),
	}
	return bladeData
}

function getCore(bladePartEnum) {

	switch (bladePartEnum) {
		case BLADE_CORE.RED:
		return {
			core: new Model(spr_core1_pattern,spr_core1_material4),
			lightColor : merge_color(c_white,c_red,.4),
			energyColor : merge_color(c_white,c_red,.8)
			}
		break;
		case BLADE_CORE.BLUE:
		return {
			core: new Model(spr_core1_pattern,spr_core1_material),
			lightColor : merge_color(c_white,c_aqua,.4),
			energyColor : merge_color(c_white,c_aqua,.8)
			}
		break;
		case BLADE_CORE.GREEN:
		return {
			core: new Model(spr_core1_pattern,spr_core1_material3),
			lightColor : merge_color(c_white,c_green,.4),
			energyColor : merge_color(c_white,c_green,.8)
			}
		break;
		case BLADE_CORE.ORANGE:
		return {
			core: new Model(spr_core1_pattern,spr_core1_material5),
			lightColor : merge_color(c_white,c_orange,.4),
			energyColor : merge_color(c_white,c_orange,.8)
			}
		break;
		case BLADE_CORE.PINK:
		return {
			core: new Model(spr_core1_pattern,spr_core1_material6),
			lightColor : merge_color(c_white,c_purple,.4),
			energyColor : merge_color(c_white,c_purple,.8)
			}
		break;
		case BLADE_CORE.PURPLE:
		return {
			core: new Model(spr_core1_pattern,spr_core1_material7),
			lightColor : merge_color(c_white,c_blue,.4),
			energyColor : merge_color(c_white,c_blue,.8)
			}
		break;
		case BLADE_CORE.YELLOW:
		return {
			core: new Model(spr_core1_pattern,spr_core1_material9),
			lightColor : merge_color(c_white,c_yellow,.4),
			energyColor : merge_color(c_white,c_yellow,.8)
			}
		break;
		case BLADE_CORE.LTBLUE:
		return {
			core: new Model(spr_core1_pattern,spr_core1_material10),
			lightColor : merge_color(c_white,c_aqua,.2),
			energyColor : merge_color(c_white,c_aqua,.6)
			}
		break;
		case BLADE_CORE.LTORANGE:
		return {
			core: new Model(spr_core1_pattern,spr_core1_material11),
			lightColor : merge_color(c_white,c_orange,.2),
			energyColor : merge_color(c_white,c_orange,.6)
			}
		break;
		case BLADE_CORE.LTYELLOW:
		return {
			core: new Model(spr_core2_pattern,spr_core2_material),
			lightColor : merge_color(c_white,c_yellow,.2),
			energyColor : merge_color(c_white,c_yellow,.5)
			}
		break;
		case BLADE_CORE.LTGREEN:
		return {
			core: new Model(spr_core1_pattern,spr_core1_material12),
			lightColor : merge_color(c_white,c_green,.2),
			energyColor : merge_color(c_white,c_green,.6)
			}
		break;
	} 
}

function getHull(bladePartEnum) {
	switch (bladePartEnum) {
		case BLADE_HULL.BALANCE:
		return new Model(spr_hull1_pattern,spr_hull1_material)
		break;
		case BLADE_HULL.HURRICANE:
		return new Model(spr_hull2_pattern,spr_hull2_material)
		break;
		case BLADE_HULL.BLOSSOM:
		return new Model(spr_hull4_pattern,spr_hull4_material)
		break;
		case BLADE_HULL.CONSTRUCT:
		return new Model(spr_hull3_pattern,spr_hull3_material)
		break;
	} 
}

function getAnchor(bladePartEnum) {
	switch (bladePartEnum) {
		case BLADE_ANCHOR.PELLET:
		return new Model(spr_anchor1_pattern,spr_anchor1_material)
		break;
		case BLADE_ANCHOR.EXPLOSION:
		return new Model(spr_anchor1_pattern,spr_anchor1_material)
		break;

	} 
}