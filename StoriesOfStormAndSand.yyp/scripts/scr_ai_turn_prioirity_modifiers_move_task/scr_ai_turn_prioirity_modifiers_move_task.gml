// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_prioirity_modifiers_move_task(task){
	var result = 0
	var relative_health = task.executor.stats_current_hp/task.executor.stats_max_hp
	//Seek closest defensive terrain to final path position
	var final_index = path_get_number(task.path)-1
	var point_x = path_get_point_x(task.path, final_index)
	var point_y = path_get_point_y(task.path, final_index)
	var closest_fort = instance_nearest(point_x, point_y , obj_terrain_fort)
	if(scr_object_occupies_cell(closest_fort, point_x, point_y)){
		result +=200
	}
	//Seek healing terrain
	var closest_hospital = instance_nearest(point_x, point_y , obj_terrain_hospital)
	if(scr_object_occupies_cell(closest_hospital, point_x, point_y)){
		if(relative_health <= 0.3){		
			//When less than 30% health
			result += 600
	
		}else if (relative_health <= 0.5) {
			//Between 30% and 50%
			result += 400
	
		}else if (relative_health <= 0.8) { 
			//Between 50% and 80%
			result += 150
		}else {
			result += 100
		}
	}
	return result;
}