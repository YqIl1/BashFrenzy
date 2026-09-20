draw_self();
originX = x+lengthdir_x(50,directionToTarget)
originY = y+lengthdir_y(50,directionToTarget)
targetX = x+lengthdir_x(bossSpeed*150-traveledDistance,directionToTarget)
targetY = y+lengthdir_y(bossSpeed*150-traveledDistance,directionToTarget)

if(timerC < 0 && !dead){
	draw_line_width_colour(originX,originY,targetX,targetY,10,c_orange,c_red)
	draw_circle_colour(targetX,targetY,30,c_orange,c_red,0)
}