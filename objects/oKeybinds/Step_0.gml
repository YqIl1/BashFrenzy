if(mouse_check_button_pressed(mb_left)){
	if(position_meeting(mouse_x, mouse_y, id)){
		audio_play_sound(MouseclickSound, 1, 0)
		menuOpen = !menuOpen;
		if(oDifficulty.menuOpen){
			oDifficulty.menuOpen = !oDifficulty.menuOpen
		}
	}
}