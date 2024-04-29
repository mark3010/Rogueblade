// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_instance_farthest_other(object,range) {
	var max_distance = 0;
	var farthest = id;

	with (object)
	{
	    var distance = point_distance(other.x, other.y, x, y);
	    if (distance > max_distance)
	    {
	        max_distance = distance;
	        farthest = id;
	    }
	}

	if (farthest != id)
	{
	   return farthest
	}
}