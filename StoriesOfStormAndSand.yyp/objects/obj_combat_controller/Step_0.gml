/// @description Insert description here
// You can write your code in this editor
if(attacker_anim_done && defender_anim_done)
{
	if(!animation_end_started)
	{
		alarm[1] = animation_end_delay;
		animation_end_started = true;
	}
	
}