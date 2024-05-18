/// @description Insert description here
// You can write your code in this editor
target = id
attackQueue = []
cooldown = 0
cooldownMax = 3
attackAngle = 0

function setTarget(_target) {
	target = _target
	x = target.x
	y = target.y
}

function setQueue(_queue) {
	attackQueue = array_reverse(_queue)
}

function setAngle(_angle) {
	attackAngle = _angle
}

function reposition() {
	x = target.x
	y = target.y
}