if(!global.pause){

if(!dead){

var _player = instance_nearest(x,y,oPlayer)
var _direction = point_direction(x, y, _player.x, _player.y)

function shoot(angle, ammo){
	var _targetX = x+lengthdir_x(100,point_direction(x,y,oPlayer.x,oPlayer.y));
	var _targetY = y+lengthdir_y(100,point_direction(x,y,oPlayer.x,oPlayer.y));
	switch (ammo){
		case "bullet":
			var newBullet = instance_create_layer(_targetX, _targetY, "Instances", oBullets);
			break;
		case "torpedo":
			var newBullet = instance_create_layer(_targetX, _targetY, "Instances", oTorpedo);
			break;
		default:
			var newBullet = instance_create_layer(_targetX, _targetY, "Instances", oBullets);
			show_debug_message("unknown type")
			break;
	}		
	newBullet.direction=angle
}

function shootMany(amount, ammo, shootDirection){
	if(amount mod 2 == 1){
		numOfShot = int64(amount / 2) + 1;
	}else{
		numOfShot = amount / 2;
	}
	shootOffset = 90 / numOfShot;
	for(i = 0; i < amount; i++){
		shoot(shootDirection - 90 + shootOffset * (i + 1), ammo);
	}
}




function avoidSpike(){
	var borader = instance_nearest(x,y,oSpikes)
	if(distance_to_object(borader)< 30){
		direction = point_direction(borader.x, borader.y, x,y);
		//show_debug_message(direction)
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
		if(timerC < -30){
			directionToTarget = point_direction(x,y,d.x,d.y);
		}
	}else{
		speed = bossSpeed*15;
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
		if(global.difficulty == 4){
			shootMany(9,"bullet",_direction)
		}else if(global.difficulty == 5){
			shootMany(27,"bullet",_direction)
		}else{
			shootMany(3,"bullet",_direction)
		}
		
		audio_play_sound(FireSound, 8, false, 0.2);
		timer = 0
		if(torpedoCharge == torpedoInterval){
			if(global.difficulty == 4){
				shootMany(3,"torpedo",_direction)
			}else if(global.difficulty == 5){
				shootMany(9,"torpedo",_direction)
			}else{
				image_angle = direction;
				shoot(_direction, "torpedo");
			}
			
			
			torpedoCharge = 0;
			
				
		}else{
			torpedoCharge++;
		}
	}
}else{
	timer++
}


//damage detect
if(hp <= 0){
	death();
}



avoidSpike();

if(place_meeting(x, y, oSpikes))
{
	hp--;
	speed = -10;
}


if(chargeCooldownTick == timerC ){
	traveledDistance = 0;
	timerC = -90;
}else{
	timerC++
}

if(timerC > 0){
	speed = bossSpeed
	move()
	image_angle = direction;
	canShoot = true;
}else if(timerC < 0){
	if(global.difficulty!=5){
		canShoot = false;
	}
	charge(_player);
}


}else{
	speed = 0;
	
	if(timerE > 0){
		var e = instance_create_layer(irandom_range(bbox_left,bbox_right), irandom_range(bbox_top,bbox_bottom), "Instances", oExplosion);
		e.depth -= 1000;
	}else{

	}
	
}

//victory place, boss death
function death(){
	//have animation and stuff
	timerE = 180;
	dead = true;

	
	//room_goto(VictoryScreen)
}

if(timerE >= 0) timerE--;

}else{
	speed = 0;
}




