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
		image_angle= direction + 180;
		image_xscale *= -1;
		speed *= -1;
		canDamagePlayer = false;
	}
}