/// @description Insert description here
// You can write your code in this editor
descriptionColor = global.txtColDescription
positiveColor = global.txtColPositive
negativeColor = global.txtColNegative

//STATS
function formatStats(stats) {
	var allStats = []
	var s = variable_struct_get_names(stats)
	
	if array_contains(s,"maxLife") { 
		var formattedEntry = {}
		formattedEntry.text = "> Life: "+string(stats.maxLife)
		formattedEntry.color = descriptionColor
		array_push(allStats,formattedEntry)
		}
	if array_contains(s,"lifeRegen") {
		var formattedEntry = {}
		formattedEntry.text = "> Life regeneration: "+string(stats.lifeRegen) + "/s."
		formattedEntry.color = descriptionColor
		array_push(allStats,formattedEntry)
	}
	if array_contains(s,"maxTriggers") { 
		var formattedEntry = {}
		formattedEntry.text = "> Shield triggers: "+string(stats.maxTriggers)
		formattedEntry.color = descriptionColor
		array_push(allStats,formattedEntry)
	}
	if array_contains(s,"maxTriggersCooldown") { 
		var formattedEntry = {}
		formattedEntry.text = "> Shield trigger cooldown: "+string(stats.maxTriggersCooldown/60)+" s."
		formattedEntry.color = descriptionColor
		array_push(allStats,formattedEntry)
	}
	
	if array_contains(s,"weaponType") { 
		var formattedEntry = {}
		
		var weaponString = "MISSING"
		if stats.weaponType == BLADE_ANCHOR.PELLET {
			weaponString = "Gattling gun"
		} else if stats.weaponType == BLADE_ANCHOR.EXPLOSION {
			weaponString = "Explosions"
		}
		
		formattedEntry.text = "> Attack type: "+weaponString
		formattedEntry.color = descriptionColor
		array_push(allStats,formattedEntry)
	}
	
	//--------------------- add spacing
	if array_length(s) > 0 {
		var formattedEntry = {}
		formattedEntry.text = " "
		formattedEntry.color = descriptionColor
		array_push(allStats,formattedEntry)
	}
	//--------------------- non base stats
	
	var flip = 0
	repeat(2) {// sort so that positives are always first 
		if array_contains(s,"maxProjectiles") { 
			var plusIsPositive = true 
			if flip + plusIsPositive == 1 {
				var formattedEntry = {}
				formattedEntry.text = "additional projectiles: +"+string(stats.maxProjectiles)
				formattedEntry.color = plusPositive(stats.maxProjectiles,plusIsPositive)
				array_push(allStats,formattedEntry)
			}
		}
		
		if array_contains(s,"projectileSpread") {
			var plusIsPositive = false
			if flip + plusIsPositive == 1 {
				var formattedEntry = {}
				formattedEntry.text = "added attack angle: +"+string(stats.projectileSpread)+ " degrees"
				formattedEntry.color = plusPositive(stats.projectileSpread,plusIsPositive)
				array_push(allStats,formattedEntry)
			}
		}
		flip++
	}
	
	return allStats
}

function plusPositive(stat,boolean) {
		if stat*boolean > 0 {
			return positiveColor
		} else {
			return negativeColor
		}
}
//TIME
function gameTime10MS(gameTime) {
	return floor(gameTime * 1.666 mod 100)
}

function gameTimeS(gameTime) {
	return floor(gameTime/60 mod 60)
}

function gameTimeM(gameTime) {
	return floor(gameTime/(60*60) mod 60)
}

function gameTimeH(gameTime) {
	return floor(gameTime/(60*60*60))
}

function gameTimeFormatted(gameTime) {
	var timeFormatted = ""
	if gameTimeH(gameTime) > 0 {
		timeFormatted += string(gameTimeM(gameTime)) + " h. " 
	}
	if gameTimeM(gameTime) > 0 {
		timeFormatted += string(gameTimeM(gameTime)) + " m. " 
	}
	if gameTimeS(gameTime) >= 0 {
		timeFormatted += string(gameTimeS(gameTime)) + " s. " 
	}
	
	return timeFormatted
}