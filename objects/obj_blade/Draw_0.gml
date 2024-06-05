
// to help with arena calculations 
/*
draw_set_color(c_red)
draw_circle(arenaSlopedBorderX,arenaSlopedBorderY,10,true)
draw_circle(arenaFlatBorderX,arenaFlatBorderY,20,true)
draw_circle(arenaBaseX,arenaBaseY,30,true)
draw_set_color(c_white)
draw_text(x,y,"outOfBounds: "+ string(outOfBounds))
draw_text(x,y+10,"onGround: "+ string(onGround))
draw_text(x,y+20,"onBorder: "+ string(onBorder))
draw_text(x,y+30,"distanceVar: "+ string(point_distance(arenaBaseX,arenaBaseY,arenaSlopedBorderX,arenaSlopedBorderY)))
draw_text(x,y+40,"distanceCheck: "+ string(obj_arena.baseWidth))


