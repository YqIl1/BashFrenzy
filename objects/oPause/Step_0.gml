if(global.pause && room = MainRoom && !oPlayer.dead){
	visible = true;
}else{
	audio_resume_all()
	visible = false;
}
if(visible){
	audio_pause_all();
if(position_meeting(mouse_x,mouse_y,self)){
	image_index = 1;
	
	if(mouse_check_button(mb_left))
	{
		audio_play_sound(MouseclickSound, 1, 0)
		global.pause = ! global.pause;
	}
}else{
	image_index = 0;
}
}