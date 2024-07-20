/// @description Insert description here
// You can write your code in this editor
event_inherited()
quickVersion = false
respawning = false
velAdd = 0
deathTrigger = 80
image_xscale = 0
image_yscale = 0
particlesMod = 2 // particles at max strength, just before death
particleDist = 70
color = c_black
bladeCol = c_orange
delay1 = 0
delay2 = 0

function draw_me() {
	//var col = merge_color(c_yellow,bladeCol,image_xscale/1.5)
	gpu_set_blendmode(bm_eq_add)
	//draw_sprite_ext(spr_dq_angel,0,x,y-zPosition-40,1,1,0,color,1)
	//draw_text(x,y-zPosition-20,"-1 DQ save")
	
	draw_sprite_ext(sprite_index,0,x,y-zPosition,image_xscale * (1-quickVersion*.4),image_yscale * (1-quickVersion*.4),0,color,1)
	draw_sprite_ext(spr_light,0,x,y-zPosition,image_xscale * (1-quickVersion*.4),image_yscale * (1-quickVersion*.4),direction,bladeCol,.3)
	
	gpu_set_blendmode(bm_normal)
	//draw_sprite_ext(spr_death,0,x,y-zPosition,image_xscale,image_yscale*2,0,c_white,1)
	//draw_set_alpha( .3+(image_xscale/1.5))
	//draw_circle_color(x,y-zPosition,24/(.5+image_xscale),col,col,true)
	//draw_text(x,y-100,lifetime)
	////draw_text(x,y-90,deathTrigger)
	draw_set_alpha(1)
}

