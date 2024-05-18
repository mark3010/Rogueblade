/// @description Insert description here
// You can write your code in this editor

reposition()
if array_length(attackQueue) == 0 {instance_destroy()}// cancel self if target unalives
if !instance_exists(target) {instance_destroy()}// cancel self if target unalives

if array_length(attackQueue) > 0 && cooldown == 0{
	cooldown = cooldownMax
	//var attackType = array_first(attackQueue).attackType
	var attackDirection = array_last(attackQueue).attackDirection
	target.attack(attackDirection,attackAngle)
	array_pop(attackQueue)
}

cooldown--