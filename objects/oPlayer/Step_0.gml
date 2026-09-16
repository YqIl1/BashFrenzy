//This is where the majority of code will be
//this runs every frame

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
if(keyboard_check(ord("X")) || keyboard_check(ord("K"))){
	if(!isDashing) timer = 20;
	isDashing = true;
	speed = playerSpeed * 2.5;
	show_debug_message(timer);
}

if(isDashing && timer < 15){
	speed = 0;
}

if(isDashing && timer < 0) isDashing = false;

if(timer >= 0){
	timer--;
}

