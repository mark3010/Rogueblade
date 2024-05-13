/// @description Insert description here
// You can write your code in this editor

var radius = ( deathTrigger - lifetime ) / 20 * size
var alpha = ( deathTrigger - lifetime ) / deathTrigger / 2


gpu_set_blendmode(bm_eq_add)
draw_sprite_ext(spr_light,0,x,y-zPosition,radius,radius,direction,energyColor,alpha)
draw_sprite_ext(spr_circle4,0,target.x,target.y,radius,radius,0,energyColor,alpha)
//draw_circle(target.x,target.y,radius,false)
gpu_set_blendmode(bm_normal)