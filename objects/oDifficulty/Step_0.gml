if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		audio_play_sound(MouseclickSound, 1, 0)
        menuOpen = !menuOpen;
		if(oKeybinds.menuOpen){
			oKeybinds.menuOpen = !oKeybinds.menuOpen
		}
    }
    if (menuOpen) {
		menuLeft = bbox_left + buttonWidth;
		menuRight = bbox_right + buttonWidth;
        
        for (i = 0; i < array_length(options); i++) {
			itemTop = bbox_bottom + ((i - 3) * buttonHeight);
			itemBottom = itemTop + buttonHeight;
            if (mouse_x >= menuLeft && mouse_x <= menuRight && mouse_y >= itemTop && mouse_y <= itemBottom) {
				audio_play_sound(MouseclickSound, 1, 0)
				show_debug_message("Clicked: " + options[i]);
				switch(i){
					case 0:
						global.difficulty = 1;
						break;
					case 1:
						global.difficulty = 2;
						break;
					case 2:
						global.difficulty = 3;
						break;
					case 3:
						global.difficulty = 4;
						break;
					case 4:
						global.difficulty = 5;
						break;
				}
				menuOpen = false; // Close menu after choice
                break;
            }
        }
    }
}