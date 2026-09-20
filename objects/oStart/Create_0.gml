image_index = 0;
image_speed = 0;
if(room == Start){
	text = "START GAME";
	global.difficulty = 1;
}else if(room == EndingScreen){
	text = "TRY AGAIN";
}else if(room == VictoryScreen){
	text = "PLAY AGAIN";
}
