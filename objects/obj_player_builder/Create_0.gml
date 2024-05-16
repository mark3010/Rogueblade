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
	return bladeData
}

function getCore(bladePartEnum) {
	return obj_item_database.getCore(bladePartEnum)
}

function getHull(bladePartEnum) {
	return obj_item_database.getHull(bladePartEnum)
}

function getAnchor(bladePartEnum) {
	return obj_item_database.getAnchor(bladePartEnum)
}