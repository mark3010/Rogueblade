#region ANIMATION

var slopeAngleStrength = 0.5 // 0 is flat arena border, 1 is vertical arena border, 0.5 is 45 degree arena border
var slantHAnim = slantH * sign(obj_arena.x-x) * slopeAngleStrength * 90 // 90 is rotation at max slope slant
var slantVAnim = slantV * sign(obj_arena.y-y) * slopeAngleStrength * .3 // .1 is stretch at max slope slant

if lifetime < 1 {exit}

#endregion

#region DRAW SHADOW
var shadowX = x -(obj_arena.x - x) * 0.03
var shadowY = y -(obj_arena.y - y) * 0.03
draw_sprite_ext(spr_blade_base_shadow,0,shadowX,shadowY,1,1+slantVAnim,0-slantHAnim,c_white,.1) // draw self
#endregion

#region DRAW SELF

shader_set(shd_outline)

var texture = sprite_get_texture(sprite_index, image_index)
var t_width = texture_get_texel_width(texture)
var t_height = texture_get_texel_height(texture)

shader_set_uniform_f(shd_texel_handle,t_width,t_height)

draw_sprite_ext(sprite_index,0,x,y,1,1+slantVAnim,0-slantHAnim,c_white,1) // draw self
draw_sprite_ext(sprite_index,1,x,y,1,1+slantVAnim,0-slantHAnim,c_white,hitFlash) // draw hitflash

shader_reset()

#endregion

