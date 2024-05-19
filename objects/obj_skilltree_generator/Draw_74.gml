/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

if !surface_exists(skillTreeSurf) {
	skillTreeSurf = surface_create(skillTreeSurfSize[X],skillTreeSurfSize[Y]);
}

//DRAW SKILL TREE AND EFFECTS
var _resolutionArray = [960,540]
var _displaceX = 180
var _displaceY = 0

//ORDER:             displace surface so center is screen center	displace middle on screen		displace for zoom in animation				displace for node focus
var _camAdjustX = 0 - surface_get_width(skillTreeSurf)/2 + _resolutionArray[X]/2 + _displaceX - (interpolateZoomFill)*skillTreeSurfSize[X]/2	- interpolateFill[X]
var _camAdjustY = 0 - surface_get_height(skillTreeSurf)/2 + _resolutionArray[Y]/2 + _displaceY - (interpolateZoomFill)*skillTreeSurfSize[Y]/2	- interpolateFill[Y]

var surfaceScale = 1+(interpolateZoomFill)


draw_surface_ext(skillTreeSurf,_camAdjustX,_camAdjustY,surfaceScale,surfaceScale,0,c_white,1*interpolateZoomCurvePosition)


var _arrowSquish = 1 + (interpolateCurvePosition)*.2
var _arrowVisible = true
var _arrowYSway = -sin(current_time/240)*6
/*
if instance_exists(ObjUIIterator) {
	if ObjUIIterator.selected == noone {
		_arrowVisible = false
	}
}*/
//arrow

draw_sprite_ext(spr_passive_skill_arrow,0,_resolutionArray[X]/2+_displaceX,_resolutionArray[Y]/2+_displaceY-30-40+40*interpolateZoomCurvePosition+_arrowYSway,image_xscale,_arrowSquish,0,c_white,interpolateZoomCurvePosition*_arrowVisible)

surface_set_target(skillTreeSurf)
draw_clear_alpha(c_black,0)



//DRAW LINKS
var keys = variable_struct_get_names(skillTree);
for (var i = array_length(keys)-1; i >= 0; --i) {
	
	var _skillName = keys[i]
	var _skill = variable_struct_get(skillTree,_skillName)
	
	//DRAW LINKS FROM BASE TO FIRST NODES
	if array_length(_skill.parents) == 0 {
		
		var _drawPosXCorrectBase = (skillTreeSurfSize[X]/2+_skill.position[X])
		var _drawPosYCorrectBase = (skillTreeSurfSize[Y]/2+_skill.position[Y])
		var _drawPosXCorrectTarget = (skillTreeSurfSize[X])/2
		var _drawPosYCorrectTarget = (skillTreeSurfSize[Y])/2
		//var _drawPosXCorrectBase = (baseX+_skill.position[X])
		//var _drawPosYCorrectBase = (baseY+_skill.position[Y])
		//var _drawPosXCorrectTarget = (baseX)
		//var _drawPosYCorrectTarget = (baseY)
		
		var _dist = point_distance(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
		var _direction = point_direction(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
		var _linkActive = sign(_skill.level)
		
		draw_sprite_ext(spr_passive_skill_link,_linkActive,_drawPosXCorrectBase,_drawPosYCorrectBase,_dist,1,_direction,c_white,1)
	} else {
	//DRAW LINKS BETWEEN SKILLS AND THEIR PARENTS
		for (var n = array_length(_skill.parents)-1; n >= 0; --n) {
			var _skillTarget = variable_struct_get(skillTree,_skill.parents[n])
		
			var _drawPosXCorrectBase = (skillTreeSurfSize[X]/2+_skill.position[X])
			var _drawPosYCorrectBase = (skillTreeSurfSize[Y]/2+_skill.position[Y])
			var _drawPosXCorrectTarget = (skillTreeSurfSize[X]/2+_skillTarget.position[X])
			var _drawPosYCorrectTarget = (skillTreeSurfSize[Y]/2+_skillTarget.position[Y])
		
			var _dist = point_distance(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
			var _direction = point_direction(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
			var _linkActive = sign(_skill.level)
			
			draw_sprite_ext(spr_passive_skill_link,_linkActive,_drawPosXCorrectBase,_drawPosYCorrectBase,_dist,1,_direction,c_white,1)
		}
	}
}

surface_reset_target()