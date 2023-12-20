/// @description Insert description here
// You can write your code in this editor

//AVAILABLE UPGRADES
upgrades = {
	maxLife : 1,
	lifeRegen : 0.02,
	maxTriggers : 1,
	triggersCooldownRegen : 0.25
}

upgradeList = variable_struct_get_names(upgrades)

function getUpgrade(instance) {
	
	var randomUpgradeEntry = irandom( array_length(upgradeList) - 1 )
	
	var pickedUpgradeName = upgradeList[randomUpgradeEntry]
	var pickedUpgradeStats = variable_struct_get(upgrades,pickedUpgradeName)
	var currentUpgradeStat = variable_struct_get(instance.stats,pickedUpgradeName)
	
	var statsCombine = currentUpgradeStat + pickedUpgradeStats
	
	//update stat
	struct_set(instance.stats,pickedUpgradeName,statsCombine)
	
	//display in UI
	var text = "+" + string(pickedUpgradeStats) + " to " + string(pickedUpgradeName)
	obj_gui.updateUpgradeDisplay(text)
}