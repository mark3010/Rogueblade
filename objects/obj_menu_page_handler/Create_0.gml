/// @description Insert description here
// You can write your code in this editor
pages = []

function goTo(layerName) {
	if array_contains(pages,layerName) {
	
		var pageTotal = array_length(pages)
		for (var i = 0; pageTotal>i; i++) {
			var currentLayer = layer_get_id(pages[i])
			
			
			instance_deactivate_layer(currentLayer)
		}
		
		layer_set_visible(layerName,true)
		instance_activate_layer(layerName)
	
	} else {
		show_debug_log("ERROR: menu page not found: \"" + string(layerName) + "\"")
	}
}