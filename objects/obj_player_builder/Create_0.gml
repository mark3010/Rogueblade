/// @description Insert description here
// You can write your code in this editor
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
	variable_struct_set(bladeData.core,"partEnum",bladePartEnumCore)
	variable_struct_set(bladeData.hull,"partEnum",bladePartEnumHull)
	variable_struct_set(bladeData.anchor,"partEnum",bladePartEnumAnchor)

	return bladeData
}

function getCore(bladePartEnum) {
	var part = obj_item_database.getCore(bladePartEnum)
	variable_struct_set(part,"partEnum",bladePartEnum)
	return part
}

function getHull(bladePartEnum) {
	var part = obj_item_database.getHull(bladePartEnum)
	variable_struct_set(part,"partEnum",bladePartEnum)
	return part
}

function getAnchor(bladePartEnum) {
	var part = obj_item_database.getAnchor(bladePartEnum)
	variable_struct_set(part,"partEnum",bladePartEnum)
	return part
}