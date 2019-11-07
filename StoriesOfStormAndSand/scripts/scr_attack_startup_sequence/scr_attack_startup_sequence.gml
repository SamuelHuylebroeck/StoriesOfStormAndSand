
if(attacker != noone and defender != noone and attack != noone)
{
	global.combat_animation_playing = true;
	// Create attacker and defender controller and assign them their sprites
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
	var offset_y = platforms_offset_y ;
	var attacker_anim_control = instance_create_layer(x - offset_x, y + offset_y,"Combat_Animation",obj_combat_attacker_anim);
	attacker_anim_control.sprite_index = anim;
	attacker_anim_control.animation_hit_frame_index =  attack[attack_fields.animation_hit_frame];
	attacker_anim_control.combat_controller = self;
	attacker_anim_control.anim_death = attacker.animations[unit_animation_fields.death_attacker];
	ds_list_add(ds_list_combat_controller_components, attacker_anim_control);
	
	anim = defender.animations[unit_animation_fields.defender];
	offset_y = platforms_offset_y;
	var defender_anim_control = instance_create_layer(x + offset_x, y + offset_y,"Combat_Animation",obj_combat_defender_anim);
	defender_anim_control.sprite_index = anim;
	defender_anim_control.anim_death = defender.animations[unit_animation_fields.death_defender];
	defender_anim_control.combat_controller = self;
	ds_list_add(ds_list_combat_controller_components, defender_anim_control);
	
	//Determine the attack resolution
	//Get the refined stats
	var attack_relation = scr_attack_get_type_relation(attack[attack_fields.type], defender.stats_type);
	var defense_relation = scr_attack_get_type_relation(defender.stats_type, attack[attack_fields.type]);
	var attack_strength, attack_hit;
	switch(attack_relation)
	{
		case combat_relation.normal:
			attack_strength = attack[attack_fields.strength_normal];
			attack_hit = attack[attack_fields.hit_normal];
			break;
		case combat_relation.weak:
			attack_strength = attack[attack_fields.strength_weak];
			attack_hit = attack[attack_fields.hit_weak];
			break;
	}
	var armor, evade, spike
	switch(defense_relation)
	{
		case combat_relation.normal:
			armor = defender.stats_armor_normal;
			evade = defender.stats_evade_normal;
			spike = defender.stats_spike_normal;
			break;
		case combat_relation.weak:
			armor = defender.stats_armor_weak;
			evade = defender.stats_evade_weak;
			spike = defender.stats_spike_weak;
			break;
	}
	//calculate derived stats
	var hit_rate = attack_hit - evade;
	var potential_damage  = attack_strength - armor >= 0? attack_strength - armor : 0;
	
	//create visualization objects
	//Stat block
	var margin_x = 15;
	var margin_y = 15;
	var pos_x = top_left_corner_x + margin_x;
	var pos_y = top_left_corner_y + (height-1)* component_height - margin_y;
	var attack_stats_vis = instance_create_layer(pos_x, pos_y, "Combat_Foreground", obj_combat_attacker_stats);
	attack_stats_vis.icon = scr_select_icon(attack[attack_fields.type]);
	attack_stats_vis.damage = potential_damage;
	attack_stats_vis.hit_rate = hit_rate;
	attack_stats_vis.initialized = true;
	ds_list_add(ds_list_combat_controller_components, attack_stats_vis);
	//health bar
	var stat_card_health_bar_distance = 5;
	pos_x += attack_stats_vis.width * attack_stats_vis.component_width + stat_card_health_bar_distance;
	var attacker_health_bar_vis = instance_create_layer(pos_x, pos_y, "Combat_Foreground",obj_combat_health_bar);
	attacker_health_bar_vis.current_health = attacker.stats_current_hp;
	attacker_health_bar_vis.max_health = attacker.stats_max_hp;
	attacker_health_bar_vis.linked_anim_obj = attacker_anim_control;
	attacker_health_bar_vis.initialized = true;
	ds_list_add(ds_list_combat_controller_components, attacker_health_bar_vis);
	
	//Stat block
	var pos_x = top_left_corner_x - margin_x + (width-2) * component_width;
	var pos_y = top_left_corner_y + (height-1)* component_height - margin_y;
	var defender_stats_vis = instance_create_layer(pos_x, pos_y, "Combat_Foreground", obj_combat_defender_stats);
	defender_stats_vis.icon = scr_select_icon(defender.stats_type);
	defender_stats_vis.spike = spike;
	defender_stats_vis.initialized = true;
	ds_list_add(ds_list_combat_controller_components, defender_stats_vis);
	//health bar
	pos_x = top_left_corner_x - margin_x + (width-2) * component_width - stat_card_health_bar_distance - (attack_stats_vis.width+1) * attack_stats_vis.component_width ; //Use attacker variables because defender isn't created yet and they are the same kind of object
	var defender_health_bar_vis = instance_create_layer(pos_x, pos_y, "Combat_Foreground",obj_combat_health_bar);
	defender_health_bar_vis.current_health = defender.stats_current_hp;
	defender_health_bar_vis.max_health = defender.stats_max_hp;
	defender_health_bar_vis.linked_anim_obj = defender_anim_control;
	defender_health_bar_vis.initialized = true;
	ds_list_add(ds_list_combat_controller_components, defender_health_bar_vis);
	
	
	//resolve the attack
	//determine if hit
	var hit_roll = irandom(100);
	var is_hit = hit_roll < hit_rate;
	
	if(is_hit)
	{
		defender.stats_current_hp -= potential_damage;
		defender.stats_current_hp = defender.stats_current_hp < 0 ? 0 : defender.stats_current_hp;
		defender_health_bar_vis.target_health = defender.stats_current_hp;
		defender_health_bar_vis.health_step = potential_damage/animation_health_bar_depletion_steps;
		attacker.stats_current_hp -= spike;
		attacker.stats_current_hp = attacker.stats_current_hp < 0 ? 0 : attacker.stats_current_hp;
		attacker_health_bar_vis.target_health = attacker.stats_current_hp;
		attacker_health_bar_vis.health_step = spike/animation_health_bar_depletion_steps;
		//Check for deaths
		if(attacker.stats_current_hp <= 0)
		{
			attacker_anim_control.dies = true;
		}
		
		if(defender.stats_current_hp <= 0)
		{
			defender_anim_control.dies = true;
		}
	}else
	{
		//Assign dodge
		attacker_anim_control.miss = true;
		attacker.stats_current_hp -= spike;
		attacker.stats_current_hp = attacker.stats_current_hp < 0 ? 0 : attacker.stats_current_hp;
		attacker_health_bar_vis.target_health = attacker.stats_current_hp;
		attacker_health_bar_vis.health_step = spike/animation_health_bar_depletion_steps;
		if(attacker.stats_current_hp <= 0)
		{
			attacker_anim_control.dies = true;
		}
	}
	var delay  = animation_start_delay;
	with(attacker_anim_control)
	{
			alarm[0] = delay;
	}
}