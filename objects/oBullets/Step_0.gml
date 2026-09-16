move_bounce_solid(1)
image_angle = direction+180;
//die on hitting spike
var _hitSpike = instance_place(x,y,oSpikes);
if(_hitSpike != noone){
	instance_destroy(self);
}
