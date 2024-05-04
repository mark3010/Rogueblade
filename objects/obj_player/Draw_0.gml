/// @description Insert description here
// You can write your code in this editor
event_inherited()

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
	draw_set_color(c_white)
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
	draw_text(x+40,y+100,"on border: "+string(onBorder))
	
	draw_text(x+40,y+120,"anitilt X: "+string(animationTilt[@ X]))
	draw_text(x+40,y+130,"anitilt Y: "+string(animationTilt[@ Y]))
	


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