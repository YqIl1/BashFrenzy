//This is where the majority of code will be
//this runs every frame

/*


Set the invincible boolean to true in the variable defintions
if you want to test the game without dying




*/


function death()
{
	if(hp <= 0)
	{
		//put death animations and other things here
		speed = 0;
		audio_stop_all()
		dead = true;
		global.pause = true;
		timerD = 360;
	}
}
if(dead == true && timerD <= 0){
	room_goto(EndingScreen);
}else if(dead == true){
	if((timerD mod 9) == 0){
		show_debug_message("a")
		var e = instance_create_layer(irandom_range(bbox_left,bbox_right), irandom_range(bbox_top,bbox_bottom), "Instances", oExplosion);
		e.depth -= 1000;
		
	}
	timerD --
	
}


if(!oPlayer.dead && !oBoss.dead)
{
if(keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("P"))){
	global.pause = !global.pause;
	speed = 0;
}
}

if(global.pause){
	image_speed = 0;
}

if(!global.pause)
{

x = clamp(x, 0, room_width); 
y = clamp(y, 0, room_height); 

//Face mouse
toMouseDirection = point_direction(x,y,mouse_x,mouse_y);

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

//Dash
if((keyboard_check(ord("X")) || keyboard_check(ord("K"))|| mouse_check_button(mb_right)) && !isParrying){
	if(!isDashing) timer = 15;
	isDashing = true;
	invincible = true;
	speed = playerSpeed * 2.5;
}


//Dash animation
if(isDashing)
{
	//dashing animation
	sprite_index = sPlayer_Dash;
	//dashing timers
	if(timer < 3)
	{
		speed = 0;
	}

	if(timer < 0)
	{
		invincible = false;
		sprite_index = sPlayer;
		isDashing = false;
	}
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
	if(toMouseDirection == 0 || toMouseDirection == 45 || toMouseDirection == 315)
	{
		h = 1;
	}
	else if(toMouseDirection == 135 || toMouseDirection == 180 || toMouseDirection == 215)
	{
		h = -1;
	}

	if(toMouseDirection == 45 || toMouseDirection == 90 || toMouseDirection == 135) 
	{
		v = -1;
	}
	else if(toMouseDirection == 215 || toMouseDirection == 270 || toMouseDirection == 315)
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
if((keyboard_check(ord("Z")) || keyboard_check(ord("L"))|| mouse_check_button(mb_left)) && !isDashing && !isParrying)
{
	parry.x = x + displacement()[0] * 50;
	parry.y = y + displacement()[1] * 50;
	parry.visible = true;
	timer = parryTimerMax;
	isParrying = true;
	image_index = 0;
	audio_play_sound(SlashSound, 8, false, 0.8);
}



//animation playback control
if (image_index >= image_number - 1){
	image_speed = 0;
	//lock on the last frame
	image_index = image_number - 1;
}
	

//contains all relevant timers for parry window
if(isParrying)
{
	sprite_index = sPlayerSwing;
	image_speed = 1;
	if(isParrying && timer < parryTimerMax-5)
	{
		parry.visible = false;
	}

	if(isParrying && timer < 0){
		isParrying = false;
		sprite_index = sPlayer;
	}

	if(isParrying && timer > parryTimerMax){
		parry.speed = speed;
		parry.direction = toMouseDirection
	}
}


if (timerI >= 0){
	timerI --;
	if ((timerI mod 4) == 0){
		sprite_index = sPlayer_Dash;
	}else{
		sprite_index = sPlayer;
	}
}else{
	invincible = false;
}
image_angle = toMouseDirection+90;
//Death code
if(place_meeting(x, y, oSpikes) || place_meeting(x, y, oBoss) ||  place_meeting(x, y, oBullets) || place_meeting(x, y, oTorpedo))
{
	//show_debug_message("ahh")
	if(!invincible){
		hp = place_meeting(x, y, oTorpedo)? hp - 3: hp - 1;
		timerI = 45;
		invincible = true;
	}
	death();
}

}
