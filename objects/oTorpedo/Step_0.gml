//Make this object explode when it reaches a wall or player - switch the sprite to explosion
function explode(){
	speed = 0;
	exploding = true;
	sprite_index = sExplosion;
}
	

if(exploding == false)
{
	image_angle = direction+180;
	//die on hitting spike
	

	if(oPlayer.isParrying && canDamagePlayer)
	{
		if(place_meeting(x, y, oBat) && oBat.visible)
		{
			direction = point_direction(x, y, oPlayer.x, oPlayer.y);
			image_angle= direction + 180;
			image_xscale *= -1;
			speed *= -1;
			canDamagePlayer = false;
		
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

timer++;
if (timer>=30 && !exploding)
{
	direction = point_direction(x,y,oPlayer.x,oPlayer.y);
	timer = 0;
}
if(place_meeting(x, y, oSpikes))
{
	explode();
}
if(place_meeting(x, y, oPlayer)&& canDamagePlayer)
{
	explode();
}

if(place_meeting(x, y, oBoss)&& !canDamagePlayer)
{	
	if(!exploding)
	{
	oBoss.hp -= 5;
	}
	explode();
}
