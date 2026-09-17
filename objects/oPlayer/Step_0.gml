//This is where the majority of code will be
//this runs every frame

/*


Set the invincible boolean to true in the variable defintions
if you want to test the game without dying




*/



//Player Movement
function isUp(){
	return 	keyboard_check(ord("W")) || keyboard_check(vk_up);
}
function isLeft(){
	return 	keyboard_check(ord("A")) || keyboard_check(vk_left);
}
function isDown(){
	return 	keyboard_check(ord("S")) || keyboard_check(vk_down);
}
function isRight(){
	return 	keyboard_check(ord("D")) || keyboard_check(vk_right);
}

if(isUp() && !isDashing){
	direction = 90;
	if(isLeft()) 
		direction = 135;
	if(isRight())
		direction = 45;
	speed = playerSpeed;
}

if(isLeft() && !isDashing){
	direction = 180; 
	if(isUp())
		direction = 135;
	if(isDown())
		direction = 225;
	speed = playerSpeed;
}

if(isDown() && !isDashing){
	direction = 270;
		if(isLeft()) 
		direction = 225;
	if(isRight())
		direction = 315;
	speed = playerSpeed;
}

if(isRight() && !isDashing){
	direction = 0;
		if(isUp())
		direction = 45;
	if(isDown())
		direction = 315;
	speed = playerSpeed;
}

//Stopping player movement
if((keyboard_check_released(ord("W")) || keyboard_check_released(vk_up) || keyboard_check_released(ord("A")) || keyboard_check_released(vk_left) || keyboard_check_released(ord("S")) || keyboard_check_released(vk_down) || keyboard_check_released(ord("D")) || keyboard_check_released(vk_right)) && !isDashing){
	speed = 0;
}

//Parry
if((keyboard_check(ord("X")) || keyboard_check(ord("K"))) && !isParrying){
	if(!isDashing) timer = 15;
	isDashing = true;
	speed = playerSpeed * 2.5;
}

if(isDashing && timer < 10)
{
	speed = 0;
}

if(isDashing && timer < 0)
{
	isDashing = false;
}

//Timer
if(timer >= 0)
{
	timer--;
}

//Parry
function displacement()
{
	var h = 0.0, v = 0.0;
	//show_debug_message(direction);
	if(direction == 0 || direction == 45 || direction == 315)
	{
		h = 1;
	}
	else if(direction == 135 || direction == 180 || direction == 215)
	{
		h = -1;
	}

	if(direction == 45 || direction == 90 || direction == 135) 
	{
		v = -1;
	}
	else if(direction == 215 || direction == 270 || direction == 315)
	{
		v = 1;
	}
	
	if(abs(h) == abs(v))
	{
		h = h/sqrt(2);
		v = v/sqrt(2);
	}
	return [h,v];
}
//Changed timer to equal parryTimerMax in order to make it easier to edit the time interval
if((keyboard_check(ord("Z")) || keyboard_check(ord("L"))) && !isDashing && !isParrying)
{
	parry.x = x + displacement()[0] * 50;
	parry.y = y + displacement()[1] * 50;
	parry.visible = true;
	timer = parryTimerMax;
	isParrying = true;
}

//contains all relevant timers for parry window
if (isParrying)
{
	if(isParrying && timer < parryTimerMax)
	{
		parry.visible = false;
	}

	if(isParrying && timer < 0){
		isParrying = false;
	}

	if(isParrying && timer > parryTimerMax){
		parry.speed = speed;
		parry.direction = direction
	}
}


//Death code
if(place_meeting(x, y, oSpikes) || place_meeting(x, y, oBullets))
{
	death();
}

function death()
{
	if(!invincible)
	{
		//put death animations and other things here
		room_restart();
	}
}