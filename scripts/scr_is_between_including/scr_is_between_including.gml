// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_is_between_including(argument0,argument1,argument2){
	/// scr_is_between(x, a, b)
	var i = argument0;
	var a = argument1;
	var b = argument2;

	var left = min(a,b);
	var right = max(a,b);

	return (left <= i && i <= right)
}