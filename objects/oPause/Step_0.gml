if(global.pause && room = MainRoom && !oPlayer.dead){
	visible = true;
}else{
	visible = false;
}
if(visible){
if(position_meeting(mouse_x,mouse_y,self)){
	image_index = 1;
	
	if(mouse_check_button(mb_left))
	{
		global.pause = ! global.pause;
	}
}else{
	image_index = 0;
}
}