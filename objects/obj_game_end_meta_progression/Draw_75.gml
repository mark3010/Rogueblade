/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(renderTarget)) { 
	renderTarget = surface_create(32*6,32*6)
}
	
if (!surface_exists(renderSlice)) { 
	renderSlice = surface_create(64,64)
}

if (!surface_exists(renderEffect)) { 
	renderEffect = surface_create(32,32)
}

var unlocksEnumList = obj_file_handler.getAllUnlocks()

var displaceY = -170
//scr_textStyle1(960/2,540/2+displaceY,"Career level progression",global.font,fa_center,color,overlayAlpha*textDisplay,2)

displaceY += 50

var careerLevelText = "Career level: "+string(previousLevel)

if previousLevel == array_length(unlocksEnumList) {
	careerLevelText += " (MAX)"
}
scr_textStyle1(960/2,540/2+displaceY,careerLevelText,global.font,fa_center,color,overlayText2Alpha*textDisplay,1+popAnimation)
displaceY += 20

//progress bar
var progressW = 32
var progressH = 4
draw_set_alpha(overlayText2Alpha*textDisplay)
draw_rectangle_color(960/2-progressW,540/2+displaceY-progressH,960/2+progressW-2,540/2+progressH-2+displaceY-1,global.txtColHighlight,global.txtColHighlight,global.txtColHighlight,global.txtColHighlight,true)
draw_sprite_stretched_ext(spr_wave_timer_bar, 2, 960/2-progressW, 540/2+displaceY-progressH/2-3, progressW*2 * currentProgressScale, (progressH)*2,global.txtColPositive,overlayText2Alpha)
draw_sprite_stretched(spr_wave_timer_bar, 1, 960/2-progressW, 540/2+displaceY-progressH/2-3, progressW*2 * currentProgressScaleBase, (progressH)*2)
draw_set_alpha(1)
displaceY += 10

//next unlock
var partName = ""


if array_length(unlocksEnumList) <= previousLevel { //if no more unlocks exist
	var partType = "NONE"
} else {											//if unlocks still exist
	var partType = unlocksEnumList[previousLevel].type
}


var squareW = 40
var squareH = 40
var squareYOffset = 34

var UnlockablesLeft = true
switch (partType)
{
    case "CORE":
	
		var part = obj_item_database.getCore(unlocksEnumList[previousLevel].partEnum)
        partName = "[CORE] "+ string(part.name)
		
		layerNumber = 0
		scr_render3d_v2(part.core,renderTarget,renderSlice,renderEffect,c_white,tiltAnim,true)
		var squareCenterX = 960/2-surface_get_width(renderTarget)/2
		var squareCenterY = 540/2+displaceY+squareYOffset-surface_get_height(renderTarget)/2 + sin((rotationAnim*3) / 360) * 3 + 3
		//shader_set(shd_outline)
		draw_surface_ext(renderTarget,squareCenterX,squareCenterY,1,1,slantH,c_white,overlayText2Alpha*textDisplay)
		//shader_reset()
		//cleanup
		surface_set_target(renderTarget)
		draw_clear_alpha(c_red,0)
		surface_reset_target()
		surface_set_target(renderSlice)
		draw_clear_alpha(c_white,0)
		surface_reset_target()
		
    break;

    case "HULL":
		var part = obj_item_database.getHull(unlocksEnumList[previousLevel].partEnum)
        partName = "[HULL] "+ string(part.name)
		
		layerNumber = 0
		scr_render3d_v2(part.hull,renderTarget,renderSlice,renderEffect,c_white,tiltAnim,false)
		var squareCenterX = 960/2-surface_get_width(renderTarget)/2
		var squareCenterY = 540/2+displaceY+squareYOffset-surface_get_height(renderTarget)/2 + sin((rotationAnim*3) / 360) * 3 + 6
		//shader_set(shd_outline)
		draw_surface_ext(renderTarget,squareCenterX,squareCenterY,1,1,slantH,c_white,overlayText2Alpha*textDisplay)
		//shader_reset()
		//cleanup
		surface_set_target(renderTarget)
		draw_clear_alpha(c_red,0)
		surface_reset_target()
		surface_set_target(renderSlice)
		draw_clear_alpha(c_white,0)
		surface_reset_target()
    break;

     case "ANCHOR":
		var part = obj_item_database.getHull(unlocksEnumList[previousLevel].partEnum)
        partName = "[ANCHOR] "+ string(part.name)
				
		layerNumber = 0
		scr_render3d_v2(part.anchor,renderTarget,renderSlice,renderEffect,c_white,tiltAnim,false)
		var squareCenterX = 960/2-surface_get_width(renderTarget)/2
		var squareCenterY = 540/2+displaceY+squareYOffset-surface_get_height(renderTarget)/2 + sin((rotationAnim*3) / 360) * 3 + 6
		//shader_set(shd_outline)
		draw_surface_ext(renderTarget,squareCenterX,squareCenterY,1,1,slantH,c_white,overlayText2Alpha*textDisplay)
		//shader_reset()
		//cleanup
		surface_set_target(renderTarget)
		draw_clear_alpha(c_red,0)
		surface_reset_target()
		surface_set_target(renderSlice)
		draw_clear_alpha(c_white,0)
		surface_reset_target()
	break;
	
	default: // if no unlock exists
		UnlockablesLeft = false

}

//scr_textStyle1(960/2,540/2+displaceY,"Next Unlock:",global.font,fa_center,global.txtColPositive,overlayText2Alpha*textDisplay,1)

draw_set_color(global.txtColDescription)
draw_set_alpha(overlayText2Alpha)
draw_sprite_ext(spr_unlockable_frame,0,960/2,540/2+displaceY+squareYOffset,1,1,0,c_white,overlayText2Alpha)
//draw_rectangle(960/2-squareW,540/2+displaceY-squareH+squareYOffset,960/2+squareW,540/2+displaceY+squareH+squareYOffset,true)
if !UnlockablesLeft {
		var squareCenterX = 960/2
		var squareCenterY = 540/2+displaceY+squareYOffset + sin((rotationAnim*3) / 360) * 3-8
		scr_textStyle1(squareCenterX,squareCenterY, "All parts\nunlocked!",font_silkscreen,fa_center,global.txtColDescription,overlayText2Alpha*textDisplay,1)
}
displaceY += 76
scr_textStyle1(960/2,540/2+displaceY,"Next Unlock"+partName,global.font,fa_center,global.txtColPositive,overlayText2Alpha*textDisplay,1)

displaceY += 20
draw_set_color(c_black)
draw_set_alpha(overlayText2Alpha)
draw_line_width(960/2-40,540/2+displaceY+1,960/2+40,540/2+displaceY+1,1)

draw_set_color(global.txtColDark)
draw_line_width(960/2-40,540/2+displaceY,960/2+40,540/2+displaceY,1)

draw_set_color(c_white)
draw_set_alpha(1)
//new unlocks
if array_length(upgradesUnlockedList)< 1 {exit}

displaceY += 40
var xListDisplace = 0
for (var i = 0; i < array_length(upgradesUnlockedList); i++) {
	
	var popVar = 0
	if i == (array_length(upgradesUnlockedList)-1) {popVar = 1}
	
	var xStart = (array_length(upgradesUnlockedList)-1)/2*70
	drawPart(upgradesUnlockedList[i],960/2+xListDisplace-xStart,540/2+displaceY,i,1+popVar*popAnimation)
	scr_textStyle1(960/2+xListDisplace-xStart,540/2+displaceY+30,upgradesUnlockedList[i].part.name,global.font,fa_center,global.txtColPositive,overlayText2Alpha*textDisplay,1)
	xListDisplace += 70
}

displaceY += 50
scr_textStyle1(960/2,540/2+displaceY,"New unlocks aquired!",global.font,fa_center,global.txtColDescription,overlayText2Alpha*textDisplay,1)