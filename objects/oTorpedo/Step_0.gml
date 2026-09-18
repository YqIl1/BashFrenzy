//Make this object explode when it reaches a wall or player - switch the sprite to explosion
if(exploding == false)
{
	move_bounce_solid(1)
	image_angle = direction+180;
	//die on hitting spike
	

	if(oPlayer.isParrying)
	{
		if(place_meeting(x, y, oBat) && oBat.visible)
		{
			image_angle= direction + 180;
			image_xscale *= -1;
			speed *= -1;
		
		}
	}
}
else
{
	if(image_index == 5)
	{
		instance_destroy(self);
	}
	
}

if(place_meeting(x, y, oSpikes) || place_meeting(x, y, oPlayer) || (place_meeting(x, y, oBoss)))
{
		exploding = true;
		sprite_index = sExplosion;
}
