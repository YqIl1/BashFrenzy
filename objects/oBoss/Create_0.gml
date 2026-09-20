
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

//health
hp = 100;
hp_max = 100;

//charge timer
chargeCooldown = 5;
chargeCooldownTick = chargeCooldown * 60;
timerC = 0;
traveledDistance = 0;
directionToTarget = 0;

//sound timer
ChargeSoundPlay = true;