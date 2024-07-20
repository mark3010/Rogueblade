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

	//check if part of current selection
	var _possibleSelection = false

	for (var l = 0; l < array_length(obj_skilltree_upgrade_generator.upgrades);l++) {
	
		if _me.name == obj_skilltree_upgrade_generator.upgrades[l].name {
			_possibleSelection = true
		}
	}
	
	//color highlighting
	/*var _colAmount = 0
	
	if !_assigned {
		_colAmount = .5 //note: when button is selected image index == 1
	}
	var _baseCol = merge_colour(c_white, c_black, _colAmount);
	*/
	
	if !_assigned && !_possibleSelection {
		shader_set(shd_greyscale)
	}
	
	draw_sprite_ext(sprite_index,_assigned,_xTreeBase+baseXOffset,_yTreeBase+baseYOffset,1,1,0,c_white,1)
	
	if !_assigned && !_possibleSelection {
		shader_reset()
	}
	
	if !_assigned {
		shader_set(shd_flash)
		draw_sprite_ext(sprite_index,_assigned,_xTreeBase+baseXOffset,_yTreeBase+baseYOffset,1,1,0,c_black,.5)
		shader_reset()
	}
	
	if _possibleSelection {
		gpu_set_blendmode(bm_eq_add)
		draw_sprite_ext(spr_passive_skills_highlight,0,_xTreeBase+baseXOffset,_yTreeBase+baseYOffset,1,1,0,c_white,(0.5 + abs(sin(current_time/400))*.5)*.3)
		gpu_set_blendmode(bm_normal)
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
