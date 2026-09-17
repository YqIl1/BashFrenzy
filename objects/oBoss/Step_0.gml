
var _player = instance_nearest(x,y,oPlayer)
var _direction = point_direction(x, y, _player.x, _player.y)
function shoot(angle){
	var newBullet = instance_create_layer(self.x, self.y, "Instances", oBullets);
	newBullet.direction=angle
}

if (shootCooldownTick == timer){
	shoot(_direction)
	shoot(_direction-45)
	shoot(_direction+45)
	timer = 0
}else{
	timer++
}


var _borader = instance_nearest(x,y,oSpikes)
if(distance_to_object(_borader)< 30){
	direction = point_direction(_borader.x, _borader.y, x,y);
}
if (directionChangeCooldownTick == timerM){
	direction += irandom_range(-15,15);
	timerM = 0
}else{
	timerM++
}

