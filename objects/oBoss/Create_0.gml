
//wait time for shooting
shootCooldown = 0.5;
shootCooldownTick = shootCooldown * 60;
timer = 0;
canShoot = true;
torpedoCharge = 0;
torpedoInterval = 3;

//movement related
directionChangeCooldown = 2;
directionChangeCooldownTick = directionChangeCooldown * 60;
timerM = 0
bossSpeed = 2;

direction = 11;
speed = bossSpeed;


//charge timer
chargeCooldown = 5;
chargeCooldownTick = chargeCooldown * 60;
timerC = 0;
traveledDistance = 0;
directionToTarget = 0;

//sound timer
ChargeSoundPlay = true;


switch(global.difficulty){
	case 1:
		hp_max = 50;
		break;
	case 2:
		hp_max = 100;
		break;
	case 3:
		hp_max = 150;
		break;
	case 4:
		hp_max = 300;
		shootCooldownTick = 10;
		break;
	case 5:
		hp_max = 900;
		shootCooldownTick = 5;
		break;
}

//health
hp = hp_max;

dead = false;
timerE = 0;