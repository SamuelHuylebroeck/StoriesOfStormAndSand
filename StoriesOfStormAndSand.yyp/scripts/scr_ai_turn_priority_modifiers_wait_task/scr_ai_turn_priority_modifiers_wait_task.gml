// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_priority_modifiers_wait_task(task, target_flag_object){
	var result = 0;
	var relative_health = task.executor.stats_current_hp/task.executor.stats_max_hp
	if(task.executor.occupied_terrain != noone){
		if(task.executor.occupied_terrain.object_index == obj_terrain_hospital){
			if(relative_health <= 0.3){		
				//When less than 30% health
				result += 750
	
			}else if (relative_health <= 0.5) {
				//Between 30% and 50%
				result += 500
			}
	
		}
		if(object_is_ancestor(task.executor.occupied_terrain.object_index, obj_abstract_flag)){
			result += 1600
			if(object_is_ancestor(task.executor.occupied_terrain.object_index, target_flag_object)){
				//Put waiting on enemy flags higher than moving into new ones
				result +=400
			}
		}
	}
	return result;
}