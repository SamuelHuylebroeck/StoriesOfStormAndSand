// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_priority_modifiers_attack_task(task){
	var result = 0
	//Get the refined stats
	var refined_stats = scr_attack_distill_refined_stats(task.assigned_attack, task.target)
	//Killing Blow
	if(task.target.stats_current_hp <= refined_stats.pd){
		result += 500
	}
	//Death
	if(task.executor.stats_current_hp <= refined_stats.sp){
		result -= 500
	}
	//Zero damage dealt
	if(refined_stats.pd <= 0){
		result -= 500
	}
	return result
}