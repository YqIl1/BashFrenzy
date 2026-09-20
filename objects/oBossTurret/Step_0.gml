x = oBoss.x;
y = oBoss.y;
if(oBoss.canShoot){
	direction = point_direction(x,y,oPlayer.x,oPlayer.y);
}else{
	direction +=30;
}
image_angle = direction