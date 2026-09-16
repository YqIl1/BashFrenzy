if (shootCooldownTick == timer){
	show_debug_message("time got");
	var newBullet = instance_create_layer(self.x, self.y, "Instances", oBullets);
	timer = 0
}else{
	timer++
}

