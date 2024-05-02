
#region LEVEL
if room == room_arena {
	if instance_exists(obj_player) {
		playerXPScale = lerp(playerXPScale,(obj_player.EXP / obj_player.EXPCapList[obj_player.level-1]),.1)
		playerLevel = "LEVEL: " + string(obj_player.level)
	}
	
	if !surface_exists(expSurf) {
		expSurf = surface_create(expWidth,expHeight);
	}	
	
	surface_set_target(expSurf)
	draw_clear(c_black)
	draw_sprite_stretched(spr_exp_bar,1,0,0,expWidth*playerXPScale,expHeight)
	surface_reset_target()
	//draw_set_halign(fa_center)
	//draw_text(960/2,15,playerLevel)
	scr_textStyle1(960/2,15,playerLevel,global.font,fa_center,c_white,1,1)
	draw_surface(expSurf,960/2-expWidth/2,35)
}


#endregion

#region UPGRADE DISPLAY
if room == room_arena {
	if currentUpgradeTimer < currentUpgradeTimerMax {
		scr_textStyle1(960/2,65,currentUpgradeText,global.font,fa_center,c_yellow,1,1)
	}
}

#endregion

#region TIMER
if instance_exists(obj_timer) {
	//format time
	var timeFormatted = obj_text_formatter.gameTimeFormatted(obj_timer.gameTime)

	scr_textStyle1(timerPosX,timerPosY-30,timeFormatted,global.font,fa_left,c_white,1,2)
	scr_textStyle1(timerPosX,timerPosY,"Time Elapsed",global.font,fa_left,c_white,1,1)
}

#endregion

#region RESOURCES
//DRAW RESOURCES
if instance_exists(obj_player) {
	//life
	if obj_player.currentLife >= healthAnim {
		healthAnim = obj_player.currentLife;
	} else {
		healthAnim -= healthAnimSpeed
	}


	
	playerLifeScale = (obj_player.currentLife / obj_player.stats.maxLife)
	playerLifeScaleAnim = (healthAnim / obj_player.stats.maxLife)
	playerCurrentLife = obj_player.currentLife
	playerMaxLife = obj_player.stats.maxLife
	
	//triggers
	playerTriggersCooldownScale = (obj_player.currentTriggersCooldown / obj_player.stats.maxTriggersCooldown)
	playerMaxTriggers = obj_player.stats.maxTriggers
	playerCurrentTriggers = obj_player.currentTriggers
	playerMaxTriggersCooldown = obj_player.stats.maxTriggersCooldown
	playerCurrentTriggersCooldown = obj_player.currentTriggersCooldown
	

	
} else {
	playerLifeScale = 0
	playerLifeScaleAnim = 0
	playerCurrentLife = 0
}

if room == room_arena {
	if !surface_exists(healthSurf) {
		healthSurf = surface_create(healthWidth * 2 + sprite_get_width(spr_health_bar) * 4,healthHeight)
	}
	if !surface_exists(healthFillSurf) {
		healthFillSurf = surface_create(healthWidth * 2 + sprite_get_width(spr_health_bar) * 4,healthHeight)
	}
	if !surface_exists(triggersCooldownSurf) {
		triggersCooldownSurf = surface_create(triggersCooldownWidth,triggersCooldownHeight)
	}
	//life
		//life fill
		surface_set_target(healthFillSurf)
		
		draw_clear_alpha(c_red,0)
		
		draw_sprite_stretched(spr_health_bar,3,0,0,(healthWidth+8)*playerLifeScale,healthHeight)
		gpu_set_colorwriteenable(1,1,1,0)
		draw_sprite(spr_health_bar_fill,0,0,0)
		gpu_set_colorwriteenable(1,1,1,1)
		
		surface_reset_target()
		
		//healthcontainer
		surface_set_target(healthSurf)
		draw_sprite_stretched(spr_health_bar,2,0,0,healthWidth,healthHeight)
		draw_sprite_ext(spr_health_bar,0,healthWidth,0,-1,1,0,c_white,healthAlpha)

		//red part
		draw_set_alpha(1)
		gpu_set_colorwriteenable(1,1,1,0)
		
		draw_sprite_stretched(spr_health_bar,4,0,0,(healthWidth+8)*playerLifeScaleAnim,healthHeight)
		draw_surface(healthFillSurf,0,0)
		//draw_sprite_stretched(spr_health_bar,4,0,0,(healthWidth+8)*playerLifeScaleAnim,healthHeight)
		//draw_sprite_stretched(spr_health_bar,3,0,0,(healthWidth+8)*playerLifeScale,healthHeight)
		gpu_set_colorwriteenable(1,1,1,1)

		//side detail
		draw_sprite_ext(spr_health_bar,1,healthWidth,0,-1,1,0,c_white,healthAlpha)

		surface_reset_target();

		//draw on screen
		draw_surface(healthSurf,healthPosX,healthPosY)
		draw_surface_ext(healthSurf,healthPosX,healthPosY,-1,1,0,c_white,1)
		scr_textStyle1(healthPosX,healthPosY+healthNumberYOffset,string(playerCurrentLife)+"/"+string(playerMaxLife),global.font,fa_center,c_white,1,1)
	
	//trigger
		surface_set_target(triggersCooldownSurf)
	
		//cooldown container
		draw_clear(c_black)
		//blue cooldown part
		draw_sprite_stretched(spr_triggers_cooldown_bar,3,0,0,triggersCooldownWidth*playerTriggersCooldownScale,triggersCooldownHeight)

		surface_reset_target();

		//draw on screen
		draw_surface(triggersCooldownSurf,triggersCooldownPosX-triggersCooldownWidth/2,triggersCooldownPosY)
		scr_textStyle1(triggersCooldownPosX,triggersCooldownPosY-12,string(playerCurrentTriggers)+"/"+string(playerMaxTriggers),global.font,fa_center,c_white,1,1)
	
}
#endregion

#region WAVES
if instance_exists(obj_wave_director) {
	for (var i = 0; i < array_length(obj_wave_director.waveList); ++i;) {
		
		var yWaveListOffset = i*6*4
		var waveTypeNames = ["ALL","HORIZONTAL","VERTICAL","TOP","BOT","LEFT","RIGHT"]
		var waveDisplayName = obj_wave_director.waveList[i].waveName
		var waveDisplayElapsed = string(obj_wave_director.waveList[i].timer)
		var waveDisplayDirection = "Direction: "+string(waveTypeNames[obj_wave_director.waveList[i].waveDirection])
		
		//top part
		scr_textStyle1(waveListPosX,waveListPosY-yWaveListOffset-30,waveDisplayName,global.font,fa_right,c_white,1,2)
		//bottom part
		scr_textStyle1(waveListPosX,waveListPosY-yWaveListOffset,waveDisplayDirection,global.font,fa_right,c_white,1,1)
		//scr_textStyle1(waveListPosX-130,waveListPosY-yWaveListOffset,"|",global.font,fa_right,c_white,1,1)
		//scr_textStyle1(waveListPosX-140,waveListPosY-yWaveListOffset,waveDisplayElapsed,global.font,fa_right,c_white,1,1)
			
	}
}
#endregion