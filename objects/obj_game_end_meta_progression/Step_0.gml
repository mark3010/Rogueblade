/// @description Insert description here
// You can write your code in this editor

timer++

if keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) {
	timer = delay
}


if timer == delay && array_length(queue) > 0 {
	queue[array_length(queue)-1]()
	array_pop(queue)
	timer = 0
}

//if overlayFlag {
	overlayAlpha = lerp(overlayAlpha,1,0.1)
//}

if overlayText1Flag {
	overlayText1Alpha = lerp(overlayText1Alpha,1,0.1)
}

if overlayText2Flag {
	overlayText2Alpha = lerp(overlayText2Alpha,1,0.1)
}

if overlayText2Alpha > .9 {
	if addedProgressScale > 0 {
		currentProgressScale += levelAnimationSpeed
		addedProgressScale -= levelAnimationSpeed
		
		if addedProgressScale < 0 {
			currentProgressScale -= addedProgressScale
			addedProgressScale = 0
		}
	}
	
	if addedProgressScale == 0 && overlayText3Flag == false {
		popUp4()
		overlayText3Flag = true
	}
	
	if currentProgressScale >= 1 {
		currentProgressScale -= 1
		
		//LEVEL UP HERE !!!
		var unlocksEnumList = obj_file_handler.getAllUnlocks()
		
		if array_length(unlocksEnumList) > previousLevel { // append upgrade if it exists
			if unlocksEnumList[previousLevel].type == "CORE" {
				var unlockedPart = {
					part: obj_item_database.getCore(unlocksEnumList[previousLevel].partEnum),
					partEnum : unlocksEnumList[previousLevel].partEnum
					}
			} else if unlocksEnumList[previousLevel].type == "HULL" {
				var unlockedPart = {
					part: obj_item_database.getHull(unlocksEnumList[previousLevel].partEnum),
					partEnum : unlocksEnumList[previousLevel].partEnum
					}
			} else {
				var unlockedPart = {
					part: obj_item_database.getAnchor(unlocksEnumList[previousLevel].partEnum),
					partEnum : unlocksEnumList[previousLevel].partEnum
					}
			}
		
			array_push(upgradesUnlockedList, unlockedPart)
		}
		
		currentProgressScaleBase = 0
		previousLevel++
		popAnimation = 1
		
	}
}

if overlayText3Flag {
	overlayText3Alpha = lerp(overlayText3Alpha,1,0.1)
}

//blade part variables
rotationAnim += rotationBaseSpeed
popAnimation = lerp(popAnimation,0,.1)
tiltAnim = [0+sin(current_time/360)*2/10,-.8-sin(current_time/360)*2/10]
//slantH = sin(current_time/360)*70