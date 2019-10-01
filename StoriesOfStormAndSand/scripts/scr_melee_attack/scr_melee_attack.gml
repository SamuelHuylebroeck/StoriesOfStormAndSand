/// @function scr_melee_attack()
/// @description Play the melee animation for the attacking unit and resolve the damage dealt.
if(sprite_index != anim_melee)
{
	sprite_index = anim_melee;
	image_index = 0;
}
if(image_index >= image_number-1)
{
	sprite_index = anim_idle;
	var hit = irandom(100) < stats_hit_rate;
	var damage = hit?irandom(stats_might):0;
	with(global.target)
	{
		scr_deal_damage(damage);
	}
	global.attacking = false;
	global.target = noone;

}