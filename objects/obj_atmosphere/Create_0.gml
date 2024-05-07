/// @description Insert description here
// You can write your code in this editor
darknessShadeBase = c_dkgray
darknessColorBase = c_aqua
darknessMergeBase = 0.3

darknessColorTarget = merge_color(darknessShadeBase,darknessColorBase,darknessMergeBase)
darknessColorLerpFloat = .05

darknessColor = darknessColorTarget

function switchThemeLerp(newColor,float) {
	darknessColorTarget = newColor
	darknessColorLerpFloat = float
}