// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_instance_nearest_other(objectType){
	var xx,yy;
	xx = x;
	yy = y;
	x = x+10000;
	y = y+10000;
	var target =  instance_nearest(xx,yy,objectType);
	x = xx;
	y = yy;
	if target != id {return target;}
}