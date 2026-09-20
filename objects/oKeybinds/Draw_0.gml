draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x,y,"Controls")

if (menuOpen){
	
	draw_set_color(c_dkgray);
	draw_rectangle(bbox_left, bbox_bottom, bbox_right +(2 * width - 32), bbox_bottom + ((array_length(controls)) * height), false);
	for(i = 0; i < array_length(controls); i++){
		for(j = 0; j < array_length(controls[i]); j++){
			drawY = bbox_bottom + (i * height) + (height / 2);
			drawX = bbox_left + (j * (width - 32)) + (width / 2);
			if(j == 2){
				drawX = bbox_left + (j * (width - 32)- 16) + (width / 2);
			}
			draw_set_color(c_white);
			draw_text(drawX, drawY, controls[i][j]);
		}
	}
}