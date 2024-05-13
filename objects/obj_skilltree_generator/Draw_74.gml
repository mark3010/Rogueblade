/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

if !surface_exists(skillTreeSurf) {
	skillTreeSurf = surface_create(skillTreeSurfSize[X],skillTreeSurfSize[Y]);
}

//DRAW SKILL TREE AND EFFECTS
var _resolutionArray = [640,360]
var _camAdjustX = 0 - surface_get_width(skillTreeSurf)/2 + camera_get_view_width(view_camera[0])/2 //camera_get_view_x(view_camera[0])//-interpolateFill[X]*1// + (1-interpolateZoomFill)*640/2 * 1
var _camAdjustY = 0 - surface_get_height(skillTreeSurf)/2 + camera_get_view_height(view_camera[0])/2//camera_get_view_y(view_camera[0])//-interpolateFill[Y]*1// + (1-interpolateZoomFill)*360/2 * 1
var _skilltreeScale = (2-(1-interpolateZoomFill))*1


draw_surface_ext(skillTreeSurf,_camAdjustX,_camAdjustY,1,1,0,c_white,1)

var _arrowSquish = image_yscale+image_yscale*(1-interpolateCurvePosition)*.5

var _arrowVisible = true
/*
if instance_exists(ObjUIIterator) {
	if ObjUIIterator.selected == noone {
		_arrowVisible = false
	}
}*/
//arrow
//draw_sprite_ext(spr_passive_skill_arrow,0,baseX*1,baseY*1-60*1+30*1*interpolateCurvePosition,image_xscale,_arrowSquish,0,c_white,interpolateCurvePosition*_arrowVisible)

surface_set_target(skillTreeSurf)
draw_clear_alpha(c_black,0.5)



//DRAW LINKS
var keys = variable_struct_get_names(skillTree);
for (var i = array_length(keys)-1; i >= 0; --i) {
	
	var _skillName = keys[i]
	var _skill = variable_struct_get(skillTree,_skillName)
	
	//DRAW LINKS FROM BASE TO FIRST NODES
	if array_length(_skill.parents) == 0 {
		var _drawPosXCorrectBase = (skillTreeSurfSize[X]/2+_skill.position[X]/2)
		var _drawPosYCorrectBase = (skillTreeSurfSize[Y]/2+_skill.position[Y]/2)
		var _drawPosXCorrectTarget = (skillTreeSurfSize[X]/2)
		var _drawPosYCorrectTarget = (skillTreeSurfSize[Y]/2)
		
		var _dist = point_distance(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
		var _direction = point_direction(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
		var _linkActive = sign(_skill.level)
		
		draw_sprite_ext(spr_passive_skill_link,_linkActive,_drawPosXCorrectBase,_drawPosYCorrectBase,_dist,1,_direction,c_white,1)
	} else {
	//DRAW LINKS BETWEEN SKILLS AND THEIR PARENTS
		for (var n = array_length(_skill.parents)-1; n >= 0; --n) {
			var _skillTarget = variable_struct_get(skillTree,_skill.parents[n])
		
			var _drawPosXCorrectBase = (skillTreeSurfSize[X]/2+_skill.position[X]/2)
			var _drawPosYCorrectBase = (skillTreeSurfSize[Y]/2+_skill.position[Y]/2)
			var _drawPosXCorrectTarget = (skillTreeSurfSize[X]/2+_skillTarget.position[X]/2)
			var _drawPosYCorrectTarget = (skillTreeSurfSize[Y]/2+_skillTarget.position[Y]/2)
		
			var _dist = point_distance(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
			var _direction = point_direction(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
			var _linkActive = sign(_skill.level)
			
			draw_sprite_ext(spr_passive_skill_link,_linkActive,_drawPosXCorrectBase,_drawPosYCorrectBase,_dist,1,_direction,c_white,1)
		}
	}
}

surface_reset_target()