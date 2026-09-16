//This is where the majority of code will be
//this runs every frame

if(keyboard_check(ord("W"))){direction = 90; speed = global.playerSpeed;}
if(keyboard_check(ord("A"))){direction = 180; speed = global.playerSpeed;}
if(keyboard_check(ord("S"))){direction = 270; speed = global.playerSpeed;}
if(keyboard_check(ord("D"))){direction = 0; speed = global.playerSpeed;}

if(keyboard_check_released(ord("W"))){direction = 90; speed = 0;}
if(keyboard_check_released(ord("A"))){direction = 180; speed = 0;}
if(keyboard_check_released(ord("S"))){direction = 270; speed = 0;}
if(keyboard_check_released(ord("D"))){direction = 0; speed = 0;}
