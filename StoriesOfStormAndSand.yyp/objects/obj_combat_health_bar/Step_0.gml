/// @description Insert description here
// You can write your code in this editor
if(running)
{
	var next_value = current_health - health_step;
	if(next_value <= target_health)
	{
		next_value = target_health;
		running = false;
		linked_anim_obj.linked_health_bar_done = true;
		
	}
	current_health = next_value;
}