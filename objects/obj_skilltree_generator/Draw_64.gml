/// @description Insert description here
// You can write your code in this editor


//LINK
//if array_length(parents) == 0 {
//	var _dist = point_distance(x,y,ObjSkillTreeGenerator.x,ObjSkillTreeGenerator.y)
//	var _direction = point_direction(x,y,ObjSkillTreeGenerator.x,ObjSkillTreeGenerator.y)
//	draw_sprite_ext(SprPassiveSkillLink,0,x,y,_dist,image_xscale,_direction,c_white,1) 
//} else {
//	var _dist = point_distance(x,y,parents[0].x,parents[0].y)
//	var _direction = point_direction(x,y,parents[0].x,parents[0].y)
//	draw_sprite_ext(SprPassiveSkillLink,0,x,y,_dist,image_xscale,_direction,c_red,1) 
//}

//var key, value;

//SURFACE


surface_set_target(skillTreeSurf)

//BASE NODE
draw_sprite_ext(spr_passive_skill_base,image_index,skillTreeSurfSize[X]/2,skillTreeSurfSize[Y]/2,1,1,0,c_white,1)

surface_reset_target()


//FOR DEBUGGING

if !global.debugMode exit
//DRAW LINKS
var keys = variable_struct_get_names(skillTree);
for (var i = array_length(keys)-1; i >= 0; --i) {
	
	var _skillName = keys[i]
	var _skill = variable_struct_get(skillTree,_skillName)
	
	//DRAW LINKS FROM BASE TO FIRST NODES
	if array_length(_skill.parents) == 0 {
		var _drawPosXCorrectBase = (baseX+_skill.position[X])*1
		var _drawPosYCorrectBase = (baseY+_skill.position[Y])*1
		var _drawPosXCorrectTarget = (baseX)*1
		var _drawPosYCorrectTarget = (baseY)*1
		
		var _dist = point_distance(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
		var _direction = point_direction(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
		var _linkActive = sign(_skill.level)
		draw_sprite_ext(spr_passive_skill_link,_linkActive,_drawPosXCorrectBase,_drawPosYCorrectBase,_dist,image_xscale,_direction,c_blue,1)
		
	} else {
	//DRAW LINKS BETWEEN SKILLS AND THEIR PARENTS
		for (var n = array_length(_skill.parents)-1; n >= 0; --n) {
			var _skillTarget = variable_struct_get(skillTree,_skill.parents[n])
		
			var _drawPosXCorrectBase = (baseX+_skill.position[X])*1
			var _drawPosYCorrectBase = (baseY+_skill.position[Y])*1
			var _drawPosXCorrectTarget = (baseX+_skillTarget.position[X])*1
			var _drawPosYCorrectTarget = (baseY+_skillTarget.position[Y])*1
		
			var _dist = point_distance(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
			var _direction = point_direction(_drawPosXCorrectBase,_drawPosYCorrectBase,_drawPosXCorrectTarget,_drawPosYCorrectTarget)
		
			draw_sprite_ext(spr_passive_skill_link,0,_drawPosXCorrectBase,_drawPosYCorrectBase,_dist,image_xscale,_direction,c_blue,1)
		}
	}
}

//BASE NODE
draw_sprite_ext(spr_passive_skill_base,image_index,x,y,image_xscale,image_yscale,0,c_blue,1)

draw_text(x,y,"interpolatezoomcurvepos "+ string(interpolateZoomCurvePosition))
draw_text(x,y+10,"interpolatefill " +string(interpolateFill))
draw_text(x,y+20,"interpolatefilltarget " +string(interpolateFillTarget))
draw_text(x,y+30,"interpolatefillstart " +string(interpolateFillStart))
