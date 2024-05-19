// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_structs_merge(primary, secondary){
    var _ReturnStruct = primary;

    var _PropertyNames = variable_struct_get_names(secondary);
    for (var i = 0; i < array_length(_PropertyNames); i ++) {
		
		//if already exists
		if variable_struct_exists(_ReturnStruct,_PropertyNames[i]) {
			var calculation = variable_struct_get(primary, _PropertyNames[i]) + variable_struct_get(secondary, _PropertyNames[i])
            variable_struct_set(_ReturnStruct, _PropertyNames[i], calculation);
		//else make new entry
		} else {
			variable_struct_set(_ReturnStruct, _PropertyNames[i], variable_struct_get(secondary, _PropertyNames[i]));
		}
    }

    return _ReturnStruct;
}