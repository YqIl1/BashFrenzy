if(global.pause){
	speed = 0;
}else{
	speed = bulletSpeed;
}


if(oPlayer.dead || oBoss.dead){
	instance_destroy(self)
}

move_bounce_solid(1)
image_angle = direction+180;
//die on hitting spike
if(place_meeting(x, y, oSpikes))
{
	instance_destroy(self);
}

if(oPlayer.isParrying && canDamagePlayer)
{
	if(place_meeting(x, y, oBat) && oBat.visible)
	{
		direction = point_direction(oPlayer.x, oPlayer.y,x, y);
		image_angle= direction + 180;
		canDamagePlayer = false;
		audio_play_sound(ParrySound, 8, false, 0.8);
	}
}

if(place_meeting(x, y, oBoss)&&canDamagePlayer == false)
{
	audio_play_sound(TankHitSound, 8, 0, 0.6);
	oBoss.hp--;
	instance_destroy(self);
	
}