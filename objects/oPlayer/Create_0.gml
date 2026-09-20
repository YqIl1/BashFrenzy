//This is when the player is spawed

//use variable defintions
playerSpeed = 4;
isDashing = false;
isParrying = false;
image_speed = 1;
timer = 0;
parry = instance_create_layer(x,y, layer, oBat);
parry.visible = false;

//setting up the difficulty
switch(global.difficulty){
	case 1:
		hp = 5;
		break;
	case 2:
		hp = 3;
		break;
	case 3:
		hp = 1;
		break;
	case 4:
		hp = 1;
		parryTimerMax = 5;
		parry.image_yscale = 2;
		break;
	case 5:
		hp = 1;
		parryTimerMax = 5;
		parry.image_yscale = 3;
		parry.image_xscale = 1.5;
		break;
}
timerI = 0;
//let one person work on the player code at any singular time
//this will prevent merge conflicts