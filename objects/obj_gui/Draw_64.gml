
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

	scr_textStyle1(timerPosX,timerPosY-50,timeFormatted,global.font,fa_left,c_white,1,2)
	scr_textStyle1(timerPosX,timerPosY-20,"Time Elapsed",global.font,fa_left,c_white,1,1)
}



#endregion
#region KILLCOUNTER
if instance_exists(obj_killCounter) {
	scr_textStyle1(timerPosX+18,timerPosY,string(obj_killCounter.kills),global.font,fa_left,c_white,1,1)
	//scr_textStyle1(timerPosX,timerPosY,"Kills: " +string(obj_killCounter.kills),global.font,fa_left,c_white,1,1)
	draw_sprite(spr_skull,0,timerPosX,timerPosY)
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
	playerLightColor = obj_player.lightColor
	playerEnergyColor = obj_player.energyColor
	
	//indicators
	
	playerIsAttacking = lerp(playerIsAttacking,ceil(obj_player.isAttacking),.5)
	playerAttackScale = obj_player.isAttacking
	playerIsDashing = lerp(playerIsDashing,obj_player.isDashing,.5)
	playerDashScale = obj_player.dashPower
	

	
} else {
	playerLifeScale = 0
	playerLifeScaleAnim = 0
	playerCurrentLife = 0
}

if room == room_arena || global.guiTestEnable {
	
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
		draw_sprite_stretched_ext(spr_triggers_cooldown_bar,0,0,0,triggersCooldownWidth*playerTriggersCooldownScale,triggersCooldownHeight,playerLightColor,1)

		surface_reset_target();

		//draw on screen
		draw_surface(triggersCooldownSurf,triggersCooldownPosX-triggersCooldownWidth/2,triggersCooldownPosY)
		
		//draw triggers
		var triggerSprite = spr_trigger_bar
		var triggerPadding = 2
		var triggerWidth = (surface_get_width(triggersCooldownSurf) -  triggerPadding) / playerMaxTriggers - triggerPadding
		var triggerHeight = sprite_get_height(triggerSprite)
		var triggerBaseX = triggersCooldownPosX - surface_get_width(triggersCooldownSurf)/2 + triggerPadding
		var triggerBaseY = triggersCooldownPosY -triggerHeight
		var triggerDisplaceBarX = 0
		
		//draw_rectangle_color()

		repeat(playerCurrentTriggers) {
			draw_sprite_stretched_ext(spr_trigger_bar,1,triggerBaseX+triggerDisplaceBarX,triggerBaseY,triggerWidth,triggerHeight,playerEnergyColor,1)
			triggerDisplaceBarX += triggerWidth + triggerPadding
		}

		//scr_textStyle1(triggersCooldownPosX,triggersCooldownPosY-12,string(playerCurrentTriggers)+"/"+string(playerMaxTriggers),global.font,fa_center,c_white,1,1)
	
	//shooting indicator
		var indicatorXOffset = triggersCooldownWidth/2+16
		
		var shootCol = merge_color(c_yellow,c_ltgray,.5)
		draw_sprite_ext(spr_shooting_toggle,0,triggersCooldownPosX + indicatorXOffset,triggersCooldownPosY-8,1,1,0,shootCol,1)
		draw_sprite_ext(spr_shooting_toggle,1,triggersCooldownPosX + indicatorXOffset,triggersCooldownPosY-8,1,1,0,shootCol,playerIsAttacking)
		draw_sprite_ext(spr_toggle_bar,floor(playerAttackScale*sprite_get_number(spr_toggle_bar))-1,triggersCooldownPosX + indicatorXOffset,triggersCooldownPosY-8,1,1,0,c_white,playerIsAttacking)
	
		//dash indicator
		var dashCol = merge_color(c_orange,c_ltgray,.5)
		draw_sprite_ext(spr_dashing_toggle,0,triggersCooldownPosX - indicatorXOffset,triggersCooldownPosY-8,1,1,0,dashCol,1)
		draw_sprite_ext(spr_dashing_toggle,1,triggersCooldownPosX - indicatorXOffset,triggersCooldownPosY-8,1,1,0,dashCol,playerIsDashing)
		draw_sprite_ext(spr_toggle_bar,floor(playerDashScale/100*sprite_get_number(spr_toggle_bar))-1,triggersCooldownPosX - indicatorXOffset,triggersCooldownPosY-8,1,1,0,c_white,playerIsDashing)
	
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
		scr_textStyle1(waveListPosX,waveListPosY-yWaveListOffset-50,waveDisplayName,global.font,fa_right,c_white,1,2)
		//bottom part
		scr_textStyle1(waveListPosX,waveListPosY-yWaveListOffset-20,waveDisplayDirection,global.font,fa_right,c_white,1,1)

		if !surface_exists(waveTimerSurf) {
			waveTimerSurf = surface_create(waveTimerWidth,waveTimerHeight);
		}	
	
		//wave conditions
			//timer
		surface_set_target(waveTimerSurf)
		draw_clear(c_black)
		draw_rectangle_color(1,1,waveTimerWidth-2,waveTimerHeight-2,c_white,c_white,c_white,c_white,true)
		
		var waveTimePassed = obj_wave_director.waveList[i].timer
		var waveMaxTimer = obj_wave_director.waveList[i].maxTimer
		var waveTimerScale = 1 - waveTimePassed / waveMaxTimer
		
		draw_sprite_stretched(spr_wave_timer_bar, 1, 0, 0, waveTimerWidth * waveTimerScale, waveTimerHeight)
		surface_reset_target()
		
		draw_surface(waveTimerSurf,waveListPosX-waveTimerWidth,waveListPosY)
		
			//current wave kill count
		var paddingX = 10
		scr_textStyle1(waveListPosX-waveTimerWidth-paddingX,waveListPosY-yWaveListOffset,"|",global.font,fa_right,c_white,1,1)
		
		var waveKillCount = string(obj_wave_director.currentWaveKills) + "/" + string(obj_wave_director.currentWaveEntityTotal)
		scr_textStyle1(waveListPosX-waveTimerWidth-paddingX*3,waveListPosY-yWaveListOffset,waveKillCount,global.font,fa_center,c_white,1,1)
		string_width(waveKillCount)
		draw_sprite(spr_skull,1,waveListPosX-waveTimerWidth-paddingX*3-string_width(waveKillCount)-10,waveListPosY-yWaveListOffset)
			
	}
}
#endregion