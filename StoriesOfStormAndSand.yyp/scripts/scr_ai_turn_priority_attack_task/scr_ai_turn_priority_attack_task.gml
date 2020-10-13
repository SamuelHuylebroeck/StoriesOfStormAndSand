// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_priority_attack_task(executor, task, target){
	//Calculate the expected damage differential
	//Get the refined stats
	var attack = task.assigned_attack
	var refined_stats = scr_attack_distill_refined_stats(attack, target)
	var hit_rate = refined_stats.hr
	var potential_damage = refined_stats.pd 
	var spike = refined_stats.sp
	var expected_damage_delta = hit_rate/100 * potential_damage - spike
	show_debug_message("Attack priority damage delta: "+string(expected_damage_delta))
	//Get the maximum
	var max_score = executor.stats_current_hp + target.stats_current_hp
		//correct for negative values
	var expected_damage = expected_damage_delta + executor.stats_current_hp
	show_debug_message("Attack priority raw score: "+string(expected_damage))
	show_debug_message("Attack priority normalised score: "+string(expected_damage/max_score))
	return expected_damage / max_score;
}
