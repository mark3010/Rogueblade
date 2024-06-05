/// @description Insert description here
// You can write your code in this editor
enum AtmosphereTheme {
	DEFAULT,
	ORANGE,
	BLUE,
	RED,
	YELLOW,
	GREEN,
	GREY,
	NUM
}

darknessShadeBase = c_dkgray
darknessColorBase = c_aqua
darknessMergeBase = 0.3

darknessColorTarget = merge_color(darknessShadeBase,darknessColorBase,darknessMergeBase)
darknessColorLerpFloat = .05

darknessColor = darknessColorTarget

currentBackdropEffect = ["Effect_1"]
targetBackdropEffect = ["Effect_1"]

layerBackgroundAlpha = 1
currentBackdrop = "Background_1"
targetBackdrop = "Background_1"

function switchThemeLerp(theme) {
	switch theme {
		case (AtmosphereTheme.DEFAULT): 
			darknessColorTarget = merge_color(darknessShadeBase,darknessColorBase,darknessMergeBase)
			currentBackdropEffect = targetBackdropEffect
			targetBackdropEffect = ["Effect_1"]
			backgroundTransition("Background_1")
		break
		case (AtmosphereTheme.GREY): 
			darknessColorTarget = c_dkgray
			currentBackdropEffect = targetBackdropEffect
			targetBackdropEffect = []
			backgroundTransition("Background_1")
		break
		case (AtmosphereTheme.BLUE): 
			darknessColorTarget = merge_color(c_dkgray,c_aqua,.3)
			currentBackdropEffect = targetBackdropEffect
			targetBackdropEffect = ["Effect_2","Effect_2_1"]
			backgroundTransition("Background_2")
		break
		case (AtmosphereTheme.ORANGE): 
			darknessColorTarget = merge_color(c_dkgray,c_red,.3)
			currentBackdropEffect = targetBackdropEffect
			targetBackdropEffect = ["Effect_3","Effect_3_1"]
			backgroundTransition("Background_3")
		break
		case (AtmosphereTheme.GREEN): 
			darknessColorTarget = merge_color(c_dkgray,c_green,.3)
			currentBackdropEffect = targetBackdropEffect
			targetBackdropEffect = ["Effect_4","Effect_4_1"]
			backgroundTransition("Background_4")
		break
	}
}

function backgroundTransition(backgroundName) {
	currentBackdrop = targetBackdrop
	targetBackdrop = backgroundName
	layerBackgroundAlpha = 0
}

function AtmosphereInit() {
	 layer_background_visible(layer_background_get_id("Background_1"),true)
	 layer_background_alpha(layer_background_get_id("Background_1"),1)
	 layer_set_visible(layer_get_id("Effect_1"),true)
	 //layer_set_visible(layer_get_id("Effect_1_1"),true)
	 
	 layer_background_visible(layer_background_get_id("Background_2"),true)
	 layer_background_alpha(layer_background_get_id("Background_2"),0)
	 layer_set_visible(layer_get_id("Effect_2"),false)
	 layer_set_visible(layer_get_id("Effect_2_1"),false)
	 
	 layer_background_visible(layer_background_get_id("Background_3"),true)
	 layer_background_alpha(layer_background_get_id("Background_3"),0)
	 layer_set_visible(layer_get_id("Effect_3"),false)
	 layer_set_visible(layer_get_id("Effect_3_1"),false)
	 
	 layer_background_visible(layer_background_get_id("Background_4"),true)
	 layer_background_alpha(layer_background_get_id("Background_4"),0)
	 layer_set_visible(layer_get_id("Effect_4"),false)
	 layer_set_visible(layer_get_id("Effect_4_1"),false)
}

AtmosphereInit()

switchThemeLerp(irandom(AtmosphereTheme.NUM-1))