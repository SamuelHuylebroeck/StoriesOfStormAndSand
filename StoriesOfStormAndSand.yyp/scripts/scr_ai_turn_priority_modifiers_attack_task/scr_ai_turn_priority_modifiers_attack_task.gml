// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_priority_modifiers_attack_task(task, moving, target_flag_object){
	var result = 0
	//Get the refined stats
	var refined_stats = scr_attack_distill_refined_stats(task.assigned_attack, task.target)
	//target flag occupation
	if(task.target.occupied_terrain != noone && object_is_ancestor(task.target.occupied_terrain.object_index, obj_abstract_flag)){
		result +=250
	}
	var occupied_terrain = task.executor.occupied_terrain
	//If not moving, add current terrain occupation 
	if(!moving && task.executor.occupied_terrain != noone){
		//Flag
		if(object_is_ancestor(task.executor.occupied_terrain.object_index, obj_abstract_flag)){
			result += 1000
			if(task.executor.occupied_terrain.object_index== target_flag_object){
				//Put waiting on enemy flags higher than moving into new ones
				result +=1000
			}
		}
		//Fort
		if(task.executor.occupied_terrain.object_index == obj_terrain_fort){	
			result += 200
		}
		//Hospital
		if(object_is_ancestor(task.executor.occupied_terrain.object_index, obj_terrain_hospital)){	
			var relative_health = task.executor.stats_current_hp/task.executor.stats_max_hp
			result += scr_ai_turn_get_healing_modifiers(relative_health)
		}
	}
	
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