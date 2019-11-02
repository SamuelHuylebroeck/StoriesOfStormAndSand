// Create attacker and defender controller and assign them their sprites
if(attacker != noone and defender != noone)
{
	var offset_x = 0;

	if(attack[attack_fields.range_min] >1)
	{
		//ranged
		offset_x = platforms_offset_ranged_x;
	}else
	{
		//melee
		offset_x = platforms_offset_melee_x;
		
	}
	//attacker
	var anim = attack[attack_fields.animation];
	var offset_y = platforms_offset_y - sprite_get_height(anim) ;
	var attacker_anim_control = instance_create_layer(x - offset_x, y + offset_y,"Animation_Foreground",obj_combat_attacker_anim);
	attacker_anim_control.sprite_index = anim;
	
	anim = defender.animations[unit_animation_fields.defender];
	offset_y = platforms_offset_y - sprite_get_height(anim);
	var defender_anim_control = instance_create_layer(x + offset_x, y + offset_y,"Animation_Foreground",obj_combat_defender_anim);
	defender_anim_control.sprite_index = anim;
}