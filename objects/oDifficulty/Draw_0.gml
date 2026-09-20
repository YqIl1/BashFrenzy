draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x,y,"Difficulty");


if (menuOpen) {
    
    for (i = 0; i < array_length(options); i++) {
        drawY = bbox_bottom + ((i - 3) * buttonHeight) + (buttonHeight / 2);
        
        draw_set_color(c_dkgray);
        draw_rectangle(bbox_left+buttonWidth, bbox_bottom + ((i - 3) * buttonHeight), bbox_right+buttonWidth, bbox_bottom + ((i - 2) * buttonHeight), false);
        
        draw_set_color(c_white);
        draw_text(x + buttonWidth, drawY, options[i]);
    }
}