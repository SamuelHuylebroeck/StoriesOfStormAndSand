if(stats_current_hp <= 0 && !global.combat_animation_playing)
{
	image_alpha -= global.unit_fade_step;
	if(image_alpha <=0)
	{
		instance_destroy();
	}
}