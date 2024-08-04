/// @description Insert description here
// You can write your code in this editor
pages = []
pageCurrent = noone

function goTo(layerName) {
	if array_contains(pages,layerName) {
		
		with obj_ui_item {alpha = 0}
		
		var pageTotal = array_length(pages)
		for (var i = 0; pageTotal>i; i++) {
			var currentLayer = layer_get_id(pages[i])
			
			
			instance_deactivate_layer(currentLayer)
		}
		
		layer_set_visible(layerName,true)
		instance_activate_layer(layerName)
		pageCurrent = layerName
	} else {
		show_debug_log("ERROR: menu page not found: \"" + string(layerName) + "\"")
	}
}

function init(layerName) {
	goTo(layerName)
	pageCurrent = layerName
	obj_ui_selector.setBasePage(layerName)
}