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
		direction = point_direction(x, y, oPlayer.x, oPlayer.y);
		image_angle= direction + 180;
		image_xscale *= -1;
		speed *= -1;
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