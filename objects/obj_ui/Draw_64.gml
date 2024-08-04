
#region DEBUG GUI
if global.debugMode {
	var i
	for (i=0;i<2;i++) {
		//GUI variables
		var shadowDist = 1
		var lineDist = 15
		var xpos = 10
		var ypos = 10
		
		if i = 0 {
			draw_set_font(global.fontDebug)
			draw_set_color(merge_colour(c_white,c_black,1))
		} else {
			draw_set_color(merge_colour(c_white,c_white,1))
			shadowDist = 0
		}
	
		draw_set_halign(fa_left)
		draw_text(xpos,ypos+lineDist+shadowDist,string_hash_to_newline("fps: "+ string(fps)))
		draw_text(xpos,ypos+lineDist*2+shadowDist,string_hash_to_newline("real fps: "+ string(fps_real)))
		draw_text(xpos,ypos+lineDist*3+shadowDist,string_hash_to_newline("input highjack: "+ string(global.inputHighjack)))
		

		var gw = view_wport[0], gh = view_hport[0]
		
		draw_set_halign(fa_right)
		draw_text(-xpos+gw,lineDist+shadowDist-5,"debugMode")
	}
}
#endregion