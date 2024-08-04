/// @description Insert description here
// You can write your code in this editor
color = #E3F1F1
textDisplay = true

currentLevel = 0
currentExperience = 0
scoreDiff = 0
data = obj_file_handler.getProgress()
previousExperience = data.accountExperience
previousLevel = data.accountLevel

currentProgressScale = 0
currentProgressScaleBase = 0
targetProgressScale = 0

levelAnimationSpeed = 0.01
popAnimation = 0

upgradesUnlockedList = []
//surfaces
renderTarget = -1
renderSlice = -1
renderEffect = -1
layerNumber = 0
slantH = 0
slantV = 0
dashPower = 0
rotationAnim = 1
rotationBaseSpeed = 4
tiltAnim = [0,-.8]

//END GAME SEQUENCE
timer = 0
delay = 60

function popUp2() {
	overlayText1Flag = true
	
	var title = instance_create_layer(x,y,layer,obj_ui_unselectable_menu_title)
	title.text = "CAREER LEVEL PROGRESSION"
	title.x = x
	title.y = y-150
	instance_deactivate_object(title)
	}
function popUp3() {
	overlayText2Flag = true
	
	data = obj_file_handler.getProgress()
	currentLevel = data.accountLevel
	currentExperience = data.accountExperience
	
	scoreDiff = currentExperience - previousExperience
	//show_debug_message("current EXP: "+string(currentExperience))
	
	currentProgressScale = animationScaleCalc(previousExperience,previousLevel)
	currentProgressScaleBase = currentProgressScale
	addedProgressScale = animationAdditionCalculation()
	}
function popUp4() {
	//overlayText3Flag = true
	
	var skipButton = instance_create_layer(x,y+176,layer,obj_ui_unselectable)
	//
	skipButton.triggerKey = vk_space
	skipButton.text = "press SPACE to continue"

	with skipButton {
		function click() {
			if instance_exists(obj_arenaStatCounter) {
				if obj_arenaStatCounter.ascensionComplete == true {
					obj_ui_selector.goToPage("lay_menu2")
					exit
				}
			}
			obj_controller.closeRun()
			instance_destroy()
		}
	}
	
	}

queue = [popUp3]
queue = array_reverse(queue)

//ANIMATION
overlayAlpha = 0
overlayFlag = false

overlayText1Alpha = 0
overlayText1Flag = false

overlayText2Alpha = 0
overlayText2Flag = false

overlayText3Alpha = 0
overlayText3Flag = false

function animationScaleCalc(experience,level) {
	var totalExp = 0
	var i = 0
	while experience - totalExp >= 0 {
		totalExp += obj_file_handler.EXPCapList[i]
		i++	
	} 
	//totalExp -= obj_file_handler.EXPCapList[i-1]
	
	var experienceWithinLevel = experience - (totalExp - obj_file_handler.EXPCapList[i-1])

	
	var experienceWithinLevelRange = obj_file_handler.EXPCapList[level]

	var animationScale = experienceWithinLevel / experienceWithinLevelRange //totalExp / (totalExp+obj_file_handler.EXPCapList[i-1])
	
	
	return animationScale
}

function animationAdditionCalculation() {
	var addedAnim = 0
	
	//show_debug_message("currentExp: "+string(currentExperience))
	//show_debug_message("currentScale: "+string(animationScaleCalc(currentExperience)))
	//show_debug_message("previousExp: "+string(previousExperience))
	//show_debug_message("previousScale: "+string(animationScaleCalc(previousExperience)))
	
	addedAnim += animationScaleCalc(currentExperience,currentLevel) - animationScaleCalc(previousExperience,previousLevel)
	addedAnim += currentLevel - previousLevel
	
	addedAnim = max(0,addedAnim)
	//show_debug_message("added anim: "+string(addedAnim))
	return addedAnim
}

function drawPart(part,placementX,placementY,i,size) {
	
	var partType = part.part.type
	var partEnum = part.partEnum
	
	switch (partType)
	{
	    case "CORE":
	
			var bladePart = obj_item_database.getCore(partEnum)
	        partName = "[CORE] "+ string(bladePart.name)
		
			layerNumber = 0
			scr_render3d_v2(bladePart.core,renderTarget,renderSlice,renderEffect,c_white,tiltAnim,true)
			var squareCenterX = placementX-surface_get_width(renderTarget)/2*size
			var squareCenterY = placementY-surface_get_height(renderTarget)/2*size + sin((rotationAnim*3+90*i) / 360) * 3
			shader_set(shd_outline)
			draw_surface_ext(renderTarget,squareCenterX,squareCenterY,size,size,slantH,c_white,overlayText2Alpha*textDisplay)
			shader_reset()
			//cleanup
			surface_set_target(renderTarget)
			draw_clear_alpha(c_red,0)
			surface_reset_target()
			surface_set_target(renderSlice)
			draw_clear_alpha(c_white,0)
			surface_reset_target()
		
	    break;

	    case "HULL":
			var bladePart = obj_item_database.getHull(partEnum)
	        partName = "[HULL] "+ string(bladePart.name)
		
			layerNumber = 0
			scr_render3d_v2(bladePart.hull,renderTarget,renderSlice,renderEffect,c_white,tiltAnim,false)
			var squareCenterX = placementX-surface_get_width(renderTarget)/2*size
			var squareCenterY = placementY-surface_get_height(renderTarget)/2*size + sin((rotationAnim*3+90*i) / 360) * 3
			shader_set(shd_outline)
			draw_surface_ext(renderTarget,squareCenterX,squareCenterY,size,size,slantH,c_white,overlayText2Alpha*textDisplay)
			shader_reset()
			//cleanup
			surface_set_target(renderTarget)
			draw_clear_alpha(c_red,0)
			surface_reset_target()
			surface_set_target(renderSlice)
			draw_clear_alpha(c_white,0)
			surface_reset_target()
	    break;

	    default:
			var bladePart = obj_item_database.getHull(partEnum)
	        partName = "[ANCHOR] "+ string(bladePart.name)
				
			layerNumber = 0
			scr_render3d_v2(bladePart.anchor,renderTarget,renderSlice,renderEffect,c_white,tiltAnim,false)
			var squareCenterX = placementX-surface_get_width(renderTarget)/2*size
			var squareCenterY = placementY-surface_get_height(renderTarget)/2*size + sin((rotationAnim*3+90*i) / 360) * 3
			shader_set(shd_outline)
			draw_surface_ext(renderTarget,squareCenterX,squareCenterY,size,size,slantH,c_white,overlayText2Alpha*textDisplay)
			shader_reset()
			//cleanup
			surface_set_target(renderTarget)
			draw_clear_alpha(c_red,0)
			surface_reset_target()
			surface_set_target(renderSlice)
			draw_clear_alpha(c_white,0)
			surface_reset_target()
	}
}

popUp2()