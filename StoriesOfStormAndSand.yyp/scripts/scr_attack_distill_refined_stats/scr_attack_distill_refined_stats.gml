// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//@param attack
//@param defender
function scr_attack_distill_refined_stats(attack, defender){
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
	//Add in terrain
	if defender.occupied_terrain != noone
	{
		hit_rate = max(hit_rate + defender.occupied_terrain.terrain_hit_rate_mod,0);
		spike = max(spike + defender.occupied_terrain.terrain_spike_mod,0);
		armor = max(armor + defender.occupied_terrain.terrain_armor_mod,0);
	}
	var potential_damage  = attack_strength - armor >= 0? attack_strength - armor : 0;
	
	var results ={
		hr : hit_rate,
		pd: potential_damage,
		sp: spike,
	};
	return results
}