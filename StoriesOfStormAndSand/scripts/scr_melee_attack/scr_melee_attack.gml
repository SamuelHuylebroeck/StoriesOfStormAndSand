if(sprite_index != anim_melee)
{
	sprite_index = anim_melee;
	image_index = 0;
}
if(image_index >= image_number-1)
{
	sprite_index = anim_idle;
	global.attacking = false;
}