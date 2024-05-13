/// @description Insert description here
// You can write your code in this editor
var _me = variable_struct_get(obj_skilltree_generator.skillTree,structName)
var textScale = 2*1


if surface_exists(obj_skilltree_generator.skillTreeSurf) {
	
	surface_set_target(obj_skilltree_generator.skillTreeSurf)
	//NODE
	//add greying of unassigned
	var _assigned = sign(_me.level)
	var _parentsAssigned = false
	var _xTreeBase = obj_skilltree_generator.skillTreeSurfSize[X]/2
	var _yTreeBase = obj_skilltree_generator.skillTreeSurfSize[Y]/2
	
	//check if parents are assigned or not
	if array_length(_me.parents) == 0 {_parentsAssigned = true} else {
		for (var n = array_length(_me.parents)-1; n >= 0; --n) {
			var _skillTarget = variable_struct_get(obj_skilltree_generator.skillTree,_me.parents[n])
			if _skillTarget.level > 0 {
				_parentsAssigned = true
				break
			}
		}
	}

	//color highlighting
	var _colAmount = 0
	
	if !_assigned {
		_colAmount = .5 - image_index/2 //note: when button is selected image index == 1
	}
	var _baseCol = merge_colour(c_white, c_black, _colAmount);
	
	//drawing
	if !_parentsAssigned {
		//shader_set(ShdGreyScale)
		draw_sprite_ext(sprite_index,1,_xTreeBase+baseXOffset/2,_yTreeBase+baseYOffset/2,1,1,0,_baseCol,1)
		//shader_reset()
	}

	draw_sprite_ext(sprite_index,0,_xTreeBase+baseXOffset/2,_yTreeBase+baseYOffset/2,1,1,0,_baseCol,_parentsAssigned)
	
	if _me.level > 0 {
		scr_textStyle1(_xTreeBase+baseXOffset/2,_yTreeBase+baseYOffset/2+16,_me.level,font_opensans,fa_center,c_white,1,1)

	}
	

	
	surface_reset_target()
}

if !global.debugMode exit

//NODE
//add greying of unassigned
var _assigned = sign(_me.level)

if !_assigned {
	shader_set(shd_flash)
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_blue,1)
	shader_reset()
}

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_blue,_assigned +.2)

draw_text_transformed(x,y+sprite_height-string_height(_me.level)/2*textScale,_me.level,textScale,textScale,0)
