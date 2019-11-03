/// @description Insert description here
// You can write your code in this editor
if(image_index >= image_number-1)
{
	image_speed = 0;
	var delay = animation_end_delay;
	if(!finished)
	{
		with(combat_controller)
		{
			alarm[1] = delay;
		}
	}
	finished = true;
}