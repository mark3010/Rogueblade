/// @description Insert description here
// You can write your code in this editor

if point_distance(x,y,startPoint[X],startPoint[Y]) + image_xscale * (sprite_get_width(sprite_index)) > maxDistance {
	instance_destroy()
}

event_inherited()

color = merge_color(color,c_white,.2)

image_xscale += 0.5
speed += 0.5

image_angle = direction
