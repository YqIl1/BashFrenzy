draw_self()

spacing = 20;
totalW = (hp - 1) * spacing;
startX = x - totalW/2;
for(i = 0; i < hp; i++){
	draw_sprite(sHeart, 0, startX + (i * spacing), y-32);
}

	