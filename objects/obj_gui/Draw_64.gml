
//GUI variables
var shadowDist = 1
var lineDist = 15
var xpos = 10
var ypos = -10


//DEBUG GUI
if global.debugMode {
	var i
	for (i=0;i<1;i++) {
		if i = 0 {
			draw_set_font(OpenSans)
			draw_set_color(merge_colour(c_white,c_black,1))
		} else {
			draw_set_color(merge_colour(c_white,c_black,1))
			shadowDist = 0
		}
	
		draw_set_halign(fa_left);

		draw_text(xpos,ypos+lineDist+shadowDist,string_hash_to_newline("fps: "+ string(fps)))
		draw_text(xpos,ypos+lineDist*2+shadowDist,string_hash_to_newline("real fps: "+ string(fps_real)))
		//draw_text(xpos,ypos+lineDist*4+shadowDist,string_hash_to_newline("gamespeed: "+ string(global.gamespeed*100) + "%"))
	
		//var gw = global.camwidth, gh = global.camheight;
		var gw = view_wport[0], gh = view_hport[0]
		
		draw_set_halign(fa_right);
		draw_text(-xpos+gw,ypos+lineDist+shadowDist,"debugMode")
	
		// BLADE VARIABLES
		if instance_exists(obj_blade) {
			var blade = obj_blade
			draw_set_halign(fa_left)
			draw_set_color(c_black)
			draw_text(blade.x+20,blade.y-50,"-blade variables-")
			//draw_text(blade.x+20,blade.y-40,"vel vec:" + string(blade.vel))
			draw_text(blade.x+20,blade.y-30,"onSlope:" + string(blade.onSlope))
			draw_text(blade.x+20,blade.y-20,"onBorder:" + string(blade.onBorder))
		}
	
		draw_text(device_mouse_x_to_gui( 0 )+15,device_mouse_y_to_gui( 0 ),"mouseX to gui: " + string(device_mouse_x_to_gui( 0 )))
		draw_text(device_mouse_x_to_gui( 0 )+15,device_mouse_y_to_gui( 0 )+10,"mouseY to gui: " + string(device_mouse_y_to_gui( 0 )))
	}
}