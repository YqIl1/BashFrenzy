move_bounce_all(false);
var _hitSpike = instance_place(x,y,oSpikes);
if(_hitSpike != noone){
	instance_destroy(self);
}