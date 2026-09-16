
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

