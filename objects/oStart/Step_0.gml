
if(position_meeting(mouse_x,mouse_y,self)){
	image_index = 1;
	
	if(mouse_check_button(mb_left))
	{
		audio_play_sound(MouseclickSound, 1, 0)
		global.pause = false;
		room_goto(MainRoom);
	}
}else{
	image_index = 0;
}