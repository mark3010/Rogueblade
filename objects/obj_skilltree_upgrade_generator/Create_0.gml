/// @description Insert description here
// You can write your code in this editor
upgrades = []
instances = []

updateFlag = false

//GET 3 RANDOM AVAILABLE PASSIVESKILLS
function updateSelection() {
	upgrades = []
	var _nodes = []
	for (var i = 0; i < instance_number(obj_skilltree_skill); ++i;)
	{
	    _nodes[i] = instance_find(obj_skilltree_skill,i);
	}

	var _skillsAvailable = []
	var _nodesAvailable = []

	var keys = variable_struct_get_names(obj_skilltree_generator.skillTree);

	for (var i = array_length(_nodes)-1; i >= 0; --i) {
	
		var _skillName = _nodes[i].structName
		var _skill = variable_struct_get(obj_skilltree_generator.skillTree,_skillName)
	
		var _availableFlag = false
	
		//ADD SKILL IF NO PARENTS
		if array_length(_skill.parents) == 0 {
			if _skill.level == 0 {
				_availableFlag = true
			}
		} else {
		//ADD SKILL IF ONE OR MORE PARENTS ASSIGNED
			for (var n = array_length(_skill.parents)-1; n >= 0; --n) {
			
				var _skillTarget = variable_struct_get(obj_skilltree_generator.skillTree,_skill.parents[n])
			
				if (_skillTarget.level > 0) {
					if _skill.level == 0 {
						_availableFlag = true
					}
				}
			}
		}
	
		if _availableFlag {array_push(_skillsAvailable,_skill) }
		if _availableFlag {array_push(_nodesAvailable,_nodes[i]) }
	}

	available = _nodesAvailable
	//CHOOSE RANDOM 3 UPGRADES AVAILABLE
	var maxUpgradeAmount = 4
	var availableUpgradeAmount = array_length(available)
	var totalUpgrades = min(maxUpgradeAmount,availableUpgradeAmount)
	
	for (var j = 0; j < totalUpgrades; j++) {
		var _skillPick = irandom(array_length(_nodesAvailable)-1)
	
		if (array_length(_nodesAvailable)>0) {
			//<var _skill = _skillsAvailable[_skillPick]
			array_push(upgrades,_nodesAvailable[_skillPick])
			array_delete(_nodesAvailable,_skillPick,1)
		} else {
			array_push(upgrades,noone)
		}
	
	}
	
	//HANDLE OPTIONS
	//clean old options
	for (var k = 0; k < array_length(instances); k++) {
		instance_destroy(instances[k])
	}
	
	instances = []
	//generate choices
	for (var k = 0; k < array_length(upgrades); k++) {
		var upgradeInstance = instance_create_layer(x-200,y+20+k*20,layer,obj_ui_selectable_upgrade)
		upgradeInstance.text = upgrades[k].name
		upgradeInstance.structName = upgrades[k].structName
		array_push(instances,upgradeInstance)
	}
	
	obj_ui_selector.findStarterMenuOption()
}

updateSelection()
obj_ui_selector.forget()

randomize()