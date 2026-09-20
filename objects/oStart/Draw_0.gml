draw_self()
draw_set_halign(fa_center); 
draw_set_valign(fa_middle); 
if(position_meeting(mouse_x,mouse_y,self))
{
	draw_set_color(c_white);
}else{
	draw_set_color(c_black);
}
draw_text(x, y, text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);