// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_priority_modifiers_move_task(task, flag_object){
	var result = 0
	var relative_health = task.executor.stats_current_hp/task.executor.stats_max_hp
	//Seek closest defensive terrain to final path position
	var final_index = path_get_number(task.path)-1
	var point_x = path_get_point_x(task.path, final_index)
	var point_y = path_get_point_y(task.path, final_index)
	
	//Prioritize flags
	var closest_flag = instance_nearest(point_x, point_y, obj_abstract_flag)
	if(scr_instance_occupies_cell(closest_flag, point_x, point_y)){
		if (closest_flag.occupying_unit != noone and object_is_ancestor(closest_flag.occupying_unit.object_index, scr_get_active_side_par())){
			result -=1000
		}
		if(closest_flag.object_index == flag_object or object_is_ancestor(closest_flag.object_index, flag_object)){
			result +=300
		}
		if(closest_flag.occupying_unit == noone){
			result += 100
		}
	}
	
	var closest_fort = instance_nearest(point_x, point_y , obj_terrain_fort)
	if(scr_instance_occupies_cell(closest_fort, point_x, point_y)){
		result +=50
	}
	//Seek healing terrain
	var closest_hospital = instance_nearest(point_x, point_y , obj_terrain_hospital)
	if(scr_instance_occupies_cell(closest_hospital, point_x, point_y)){
		result += scr_ai_turn_get_healing_modifiers(relative_health)
	}
	return result;
}