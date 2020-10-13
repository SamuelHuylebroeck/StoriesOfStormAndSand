// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_priority_attack_task(executor, task, target){
	//Placeholder for now
	var max_score = target.stats_current_hp;
	var expected_damage = task.assigned_attack[attack_fields.strength_normal] - target.stats_armor_normal;
	show_debug_message("Attack priority raw score: "+string(expected_damage))
	return expected_damage / max_score;
}