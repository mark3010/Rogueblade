//CALCULATION STEP//
var slopeAngleStrength = 0.5 // 0 is flat arena border, 1 is vertical arena border, 0.5 is 45 degree arena border
var slantHAnim = slantH * sign(obj_arena.x-x) * slopeAngleStrength * 90 // 90 is rotation at max slope slant
var slantVAnim = slantV * sign(obj_arena.y-y) * slopeAngleStrength * .3 // .1 is stretch at max slope slant

//DRAW STEP//

shader_set(shd_outline)

var texture = sprite_get_texture(sprite_index, image_index)
var t_width = texture_get_texel_width(texture)
var t_height = texture_get_texel_height(texture)

shader_set_uniform_f(shd_texel_handle,t_width,t_height)

draw_sprite_ext(sprite_index,0,x,y,1*global.renderSize,1*global.renderSize+slantVAnim,0-slantHAnim,c_white,1) // draw self
draw_sprite_ext(sprite_index,1,x,y,1*global.renderSize,1*global.renderSize+slantVAnim,0-slantHAnim,c_white,hitFlash) // draw hitflash

shader_reset()

//DEBUG STUFF

if global.debugMode {
	//arena breakpoints
	draw_set_color(c_red)
	draw_circle(arenaFlatBorderX,arenaFlatBorderY,3,true)

	draw_set_color(c_blue)
	draw_circle(arenaBaseX,arenaBaseY,3,true)
	
	draw_set_color(c_yellow)
	draw_circle(arenaSlopedBorderX,arenaSlopedBorderY,3,true)
	
	draw_set_halign(fa_left)
	//blade info
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	draw_text(x+40,y,"--INSTANCE ID: "+string(instanceId) +"--")
	draw_text(x+40,y+10,"velocity: "+string(velVector))
	draw_text(x+40,y+20,"drag: "+string(dragVector))
	
	draw_text(x+40,y+30,"--breakpoints x,y--")
	draw_text(x+40,y+40,"arenaBaseX: "+string(arenaBaseX))
	draw_text(x+40,y+50,"arenaFlatBorderX: "+string(arenaFlatBorderX))
	draw_text(x+40,y+60,"arenaSlopedBorderX: "+string(arenaSlopedBorderX))
	draw_text(x+40,y+70,"slantH: "+string(slantH))
	draw_text(x+40,y+80,"slantV: "+string(slantV))
	draw_text(x+40,y+90,"hitFlash: "+string(hitFlash))


	draw_set_halign(fa_right)
	var j = 0
	draw_text(x-40,y,"--COLLISION LIST--")
	for (var k = ds_map_find_first(cooldownMap); !is_undefined(k); k = ds_map_find_next(cooldownMap, k)) {
		j+=10
		var v = cooldownMap[? k];
		draw_text(x-40,y+j,"key: " + string(k) + " value: "+string(v))
	}
	
	draw_set_halign(fa_left)
	
}

