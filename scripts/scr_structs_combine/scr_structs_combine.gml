// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_structs_combine(argument0,argument1,argument2){
	var primary = argument0
	var secondary = argument1
	var combineType = argument2
	
    var _ReturnStruct = primary;
	var i = 0
	
    if (combineType == "add") {
        var _PropertyNames = variable_struct_get_names(primary);
        for (i = 0; i < array_length(_PropertyNames); i ++) {
            if (variable_struct_exists(secondary, _PropertyNames[i]))   {
				var calculation = variable_struct_get(primary, _PropertyNames[i]) + variable_struct_get(secondary, _PropertyNames[i])
                variable_struct_set(_ReturnStruct, _PropertyNames[i], calculation);
            }
        }
    }   else    {
        var _PropertyNames = variable_struct_get_names(secondary);

        for (i = 0; i < array_length(_PropertyNames); i ++) {
			var calculation =  variable_struct_get(primary, _PropertyNames[i]) - variable_struct_get(secondary, _PropertyNames[i])
            variable_struct_set(_ReturnStruct, _PropertyNames[i], calculation);
        }
    }
	
    return _ReturnStruct;
}