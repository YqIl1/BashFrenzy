
var _player = instance_nearest(x,y,oPlayer)
var _direction = point_direction(x, y, _player.x, _player.y)

function shoot(angle){
	var newBullet = instance_create_layer(self.x, self.y, "Instances", oBullets);
	newBullet.direction=angle
}


function hurt(source){
}
	
	

function avoidSpike(){
	var borader = instance_nearest(x,y,oSpikes)
	if(distance_to_object(borader)< 30){
		direction = point_direction(borader.x, borader.y, x,y);
		show_debug_message(direction)
	}
}

//movement
function move(){
	if (directionChangeCooldownTick == timerM){
		direction += irandom_range(-15,15);
		timerM = 0
	}else{
		timerM++
	}
}
//charge

function charge(d){
	if (timerC < -10){
		if ChargeSoundPlay == true{
			audio_play_sound(ChargeSound1, 6, false, 0.8);
			ChargeSoundPlay = false;
		}
		speed = 1;
		direction = irandom_range(0,360);
		directionToTarget = point_direction(x,y,d.x,d.y)
	}else{
		speed = bossSpeed*10;
		direction = directionToTarget;
		traveledDistance += speed;
		ChargeSoundPlay = true;
	}
}

	


x = clamp(x, 64, room_width-64); 
y = clamp(y, 64, room_height-64); 
//shoot
if ((shootCooldownTick == timer)){
	if(canShoot){
		shoot(_direction)
		shoot(_direction-45)
		shoot(_direction+45)
			audio_play_sound(FireSound, 8, false, 0.2);
	timer = 0
	}
}else{
	timer++
}



avoidSpike();

if(place_meeting(x, y, oSpikes))
{
	hp--;
	speed = -10;
}


if(chargeCooldownTick == timerC ){
	traveledDistance = 0;
	timerC = -60;
}else{
	timerC++
}

if(timerC > 0){
	speed = bossSpeed
	move()
	canShoot = true;
}else if(timerC < 0){
	canShoot = false;
	charge(_player);
}



