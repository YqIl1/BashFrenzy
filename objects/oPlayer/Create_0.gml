//This is when the player is spawed

//use variable defintions
playerSpeed = 4;
isDashing = false;
isParrying = false;
image_speed = 1;
timer = 0;
parry = instance_create_layer(x,y, layer, oBat);
parry.visible = false;
//let one person work on the player code at any singular time
//this will prevent merge conflicts