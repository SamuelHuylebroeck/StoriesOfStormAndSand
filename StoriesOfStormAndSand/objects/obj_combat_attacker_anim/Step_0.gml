/// @description Insert description here
// You can write your code in this editor
if(image_index == animation_hit_frame_index)
{
	if(miss)
	{
		with(obj_combat_defender_anim)
		{
			instance_create_layer(x,y,"Combat_Foreground",obj_miss_message);
		}
	}
	
	with(obj_combat_health_bar)
	{
		running = true;
	}
	
}

if(image_index >= image_number-1)
{
	image_speed = 0;
	if(dies)
	{
		if(die_animation_started)
		{
			if(!finished)
			{
				with(combat_controller)
				{
					attacker_anim_done = true;
				}
				finished = true;
			}
		} 
		else if(linked_health_bar_done)
		{
			//Start up death animation
			sprite_index = anim_death;
			image_index = 0;
			image_speed = 1;
			die_animation_started = true;
		}
	}else
	{
		if(!finished)
		{
			with(combat_controller)
			{
				attacker_anim_done = true;
			}
			finished = true;
		}
		
	}
}