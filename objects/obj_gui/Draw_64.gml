
//GUI variables
var shadowDist = 1
var lineDist = 15
var xpos = 10
var ypos = -10

if !surface_exists(healthSurf) {
	healthSurf = surface_create(healthWidth,healthHeight)
}

//DRAW HEALTHBAR
if instance_exists(obj_player) {
	if obj_player.currentLife > healthAnim {
		healingAnim = 1
	} else {
		healingAnim = lerp(0,healingAnim,.9)
	}
	
	if obj_player.currentLife >= healthAnim {
		healthAnim = obj_player.currentLife;
	} else {
		healthAnim -= healthAnimSpeed
	}

	var playerLifeScale = (obj_player.currentLife / obj_player.maxLife)
	var playerLifeScaleAnim = (healthAnim / obj_player.maxLife)
	
	surface_set_target(healthSurf)
	
	draw_sprite_stretched(spr_healthbar,2,0,0,healthWidth,healthHeight)

	draw_sprite_ext(spr_healthbar,0,healthWidth,0,-1,1,0,c_white,healthAlpha)

	draw_set_alpha(1)

	gpu_set_colorwriteenable(1,1,1,0)

	draw_sprite_stretched(spr_healthbar,4,0,0,(healthWidth+8)*playerLifeScaleAnim,healthHeight)
	draw_sprite_stretched(spr_healthbar,3,0,0,(healthWidth+8)*playerLifeScale,healthHeight)
	draw_sprite_stretched_ext(spr_healthbar,5,0,0,(healthWidth+8)*playerLifeScale,healthHeight,c_white,healingAnim)
	
	gpu_set_colorwriteenable(1,1,1,1)

	draw_sprite_ext(spr_healthbar,1,healthWidth,0,-1,1,0,c_white,healthAlpha)

	surface_reset_target();

	
	draw_surface(healthSurf,healthPosX,healthPosY)
	draw_surface_ext(healthSurf,healthPosX,healthPosY,-1,1,0,c_white,1)

	//scr_text(healthPosX,healthPosY+healthNumberYOffset,string(obj_player.currentLife)+"/"+string(obj_player.maxLife),font_silkscreen,fa_center)
	scr_textStyle1(healthPosX,healthPosY+healthNumberYOffset,string(obj_player.currentLife)+"/"+string(obj_player.maxLife),font_silkscreen,fa_center)
}

//DEBUG GUI
if global.debugMode {
	var i
	for (i=0;i<1;i++) {
		if i = 0 {
			draw_set_font(font_opensans)
			draw_set_color(merge_colour(c_white,c_black,1))
		} else {
			draw_set_color(merge_colour(c_white,c_black,1))
			shadowDist = 0
		}
	
		draw_set_halign(fa_left);
		draw_text(xpos,ypos+lineDist+shadowDist,string_hash_to_newline("fps: "+ string(fps)))
		draw_text(xpos,ypos+lineDist*2+shadowDist,string_hash_to_newline("real fps: "+ string(fps_real)))

		var gw = view_wport[0], gh = view_hport[0]
		
		draw_set_halign(fa_right);
		draw_text(-xpos+gw,ypos+lineDist+shadowDist,"debugMode")
	}
}