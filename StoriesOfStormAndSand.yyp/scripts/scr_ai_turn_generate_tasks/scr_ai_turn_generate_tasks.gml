// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_generate_tasks(executor,targets,target_flag_object, queue){

	show_debug_message("Generating task for " + string(executor.id))
	// Generate Move Closer to flag tasks
	generate_move_closer_tasks(executor,target_flag_object, queue)
	// Generate Heal tasks
	generate_move_to_heal_tasks(executor, target_flag_object, queue)
	// Generate wait tasks
	generate_wait_task(executor,target_flag_object,  queue)
	for(var i=0; i< ds_list_size(targets); i++){
		var target = ds_list_find_value(targets, i)
		show_debug_message("Creating tasks for target " + string(target.id))
		//Generate Attack tasks
		generate_attack_tasks(executor, target, target_flag_object, queue)
		// Generate Move and Attack tasks
		generate_move_and_attack_tasks(executor, target, target_flag_object, queue)
	}

}

function generate_move_closer_tasks(executor,target_flag_object, queue){
	var center_executor = scr_get_center_of_occupied_cell(executor);
	var executor_parent = scr_get_active_side_par()
	with(obj_abstract_flag){
		//Check if flag is already occupied by a friendly
		var center_target = scr_get_center_of_occupied_cell(self)
		if(occupying_unit == noone){
			show_debug_message("Attempting to generate movement task for empty flag")
			generate_single_move_task(executor, center_executor[0], center_executor[1], center_target[0], center_target[1], target_flag_object, queue, obj_move_to_flag_task, false)
		}else if (!object_is_ancestor(occupying_unit.object_index, executor_parent)){
			var path_found = false
			var limit = 5;
			var reach = 1
			show_debug_message("Attempting to generate movement task for enemy occupied flag")
			while(!path_found and reach <= limit){
				path_found = generate_surround_move_tasks(executor, center_executor[0], center_executor[1], center_target[0], center_target[1], reach,target_flag_object, queue)
				reach++
			}
		}
	}
}

function generate_surround_move_tasks(executor, source_x, source_y,target_x, target_y, reach, flag_object, queue){
	
	var path_found = false
	//Generate move tasks around the flag
	for (var i = -reach; i <=reach; i++){
		for (var j= -reach; j <= reach; j++){
			if(i != 0 and j != 0){
				var new_target_x = target_x + i * global.grid_cell_width
				var new_target_y = target_y + j * global.grid_cell_height
				var found = generate_single_move_task(executor, source_x, source_y, new_target_x, new_target_y,flag_object, queue, obj_move_to_flag_task,false)
				path_found = path_found || found
			}					
		}
	}
	return path_found
}

function generate_single_move_task(executor, source_x, source_y, target_x, target_y,flag_object, queue,task_type, only_when_in_range){
		// Check if [x, y] is pathable and if yes, create a move task for it
		mp_grid_clear_all(global.map_grid);
		scr_add_impassible_tiles_to_grid(executor);
		//Create the path
		var path = path_add();
		var path_found = mp_grid_path(global.map_grid, path, source_x, source_y, target_x, target_y, global.path_allow_diag);
		if (path_found){
			//Calculate priority based on the total path length
			var priority = scr_ai_turn_priority_move_task_base(path)
			var	move_task = instance_create_layer(0,0,"Logic",task_type)
			move_task.executor = executor
			move_task.controller = global.ai_turn_controller;
			move_task.path = path;
			// Calculate the priority of the move task
			move_task.priority = priority  * global.ai_primary_priority_scalar
			move_task.priority_modifier += scr_ai_turn_priority_modifiers_move_task(move_task, flag_object)
			
			//Check if path length is within unit speed, and if not, snip until it matches units speed
			if(path_get_length(path) > executor.stats_move_points_sqr * global.grid_cell_width){
				show_debug_message("Path length calculated was longer than the units speed")
				if(only_when_in_range){
					return false
				}
				//show_debug_message("Unit speed: " + string(executor.stats_move_points_sqr))
				//show_debug_message("Path length in grid cells: " + string(path_get_length(path)))
				//Create a subpath out of the path
				
				var snip_length = floor(path_get_length(path)/global.grid_cell_width) - executor.stats_move_points_sqr
				show_debug_message(string(snip_length))
				for (var v=0; v<snip_length; v++){
					path_delete_point(path, path_get_number(path)-1)
				}
				show_debug_message("New path length in grid cells: "+ string(path_get_length(path)/global.grid_cell_width))
			}
			//Check if path ends at a friendly units position and snip until it doesn't
			var end_x = path_get_point_x(path, path_get_number(path) - 1)
			var end_y = path_get_point_y(path, path_get_number(path) - 1)
			var friendly_occupying_end=position_meeting(end_x, end_y, scr_get_active_side_par())
			while(friendly_occupying_end){
				//show_debug_message("Snipping last point because a friendly is on it")
				path_delete_point(path, path_get_number(path)-1)
				end_x = path_get_point_x(path, path_get_number(path) - 1)
				end_y = path_get_point_y(path, path_get_number(path) - 1)
				friendly_occupying_end=position_meeting(end_x, end_y, scr_get_active_side_par())
			}
			move_task.path = path;
			//After snipping, add some additional priority
			move_task.priority_modifier += scr_ai_turn_priority_modifiers_move_task(move_task, flag_object)
			show_debug_message("Generating Move Task")
			show_debug_message(string(move_task) + " priority: " + string(move_task.priority))
			show_debug_message(string(move_task) + " priority modifier: " + string(move_task.priority_modifier))
			ds_priority_add(queue, move_task, move_task.priority + move_task.priority_modifier)
			return true
		} else {
			show_debug_message("Path not found")
			return false
		}
}

function generate_attack_tasks(executor, target, target_flag_object, queue){
	//For each attack, check if the target is in range
	var range_to_target = floor(abs(executor.x - target.x )  + abs(executor.y - target.y) / global.grid_cell_width)
	// Check for attack one
	show_debug_message("Range to target: " + string(range_to_target))
	var attack_list = executor.ds_attack_list
	for (var i =0; i< ds_list_size(attack_list); i++){
		var attack =attack_list[| i]
		if(scr_attack_in_range(executor, target, attack)){
			show_debug_message(string(attack[attack_fields.name] +" is in range, creating task"))
			//Attack is in range, create attack task
			var	attack_task = instance_create_layer(0,0,"Logic",obj_attack_task)
			attack_task.executor = executor;
			attack_task.assigned_attack = attack
			attack_task.target = target
			attack_task.controller =  global.ai_turn_controller;
			attack_task.priority = scr_ai_turn_priority_attack_task(attack_task) * global.ai_primary_priority_scalar
			attack_task.priority_modifier += scr_ai_turn_priority_modifiers_attack_task(attack_task, false, target_flag_object)
			show_debug_message(string(attack_task) + " priority: " + string(attack_task.priority))
			show_debug_message(string(attack_task) + " priority modifier: " + string(attack_task.priority_modifier))
			ds_priority_add(queue, attack_task, attack_task.priority + attack_task.priority_modifier)
		}else{
			show_debug_message(string(attack[attack_fields.name] +" was not in range"))
		}	
	}
	
}
	
function generate_move_and_attack_tasks(executor, target,flag_object, queue){
	//Iterate over the attacks
	var attack_list = executor.ds_attack_list
	for (var a =0; a< ds_list_size(attack_list); a++){
		var attack = attack_list[| a]
		show_debug_message("Generating move and attack task for " + string(attack[attack_fields.name]))
		//For each square within the attack range
		for (var i=-attack[attack_fields.range_max]; i<= attack[attack_fields.range_max]; i++){
			for (var j=-attack[attack_fields.range_max]; j<= attack[attack_fields.range_max]; j++){
				//Stay outside of minimum range
				var range = abs(i) + abs(j)
				if (range >= attack[attack_fields.range_min] && range <= attack[attack_fields.range_max] ) {
					var center_target = scr_get_center_of_occupied_cell(target) 					
					//show_debug_message("["+string(i) +","+string(j)+"]")
					var target_x = center_target[0] + i * global.grid_cell_width
					var target_y = center_target[1] + j * global.grid_cell_height
					generate_single_move_and_attack_task(executor, target,target_x, target_y, attack,flag_object, queue)					
				}
			}
		}
	}
}

function generate_single_move_and_attack_task(executor, target, target_x, target_y, attack, flag_object, queue){
	//Generate a path
	mp_grid_clear_all(global.map_grid);
	scr_add_impassible_tiles_to_grid(executor);
	//Create the path
	var path = path_add();
	var center_executor = scr_get_center_of_occupied_cell(executor)
	var path_found = mp_grid_path(global.map_grid, path, center_executor[0], center_executor[1], target_x, target_y, global.path_allow_diag);
		if (path_found){
			//Check if path length is within movement range
			var path_in_range = path_get_length(path) <= executor.stats_move_points_sqr * global.grid_cell_width
			// Check if final position is unoccupied
			var end_x = path_get_point_x(path, path_get_number(path) - 1)
			var end_y = path_get_point_y(path, path_get_number(path) - 1)
			var parent = scr_get_active_side_par()
			var position_unoccupied = !position_meeting(end_x, end_y, parent)
			if(path_in_range and position_unoccupied){
				show_debug_message(string(attack[attack_fields.name] +" is in range after moving to ["+string(target_x) + ","+string(target_y) +"], creating task"))
				var	move_and_attack_task = instance_create_layer(0,0,"Logic",obj_move_and_attack_task)
				move_and_attack_task.executor = executor;
				move_and_attack_task.assigned_attack = attack
				move_and_attack_task.target = target
				move_and_attack_task.controller =  global.ai_turn_controller;
				move_and_attack_task.path = path
				move_and_attack_task.priority = scr_ai_turn_priority_move_and_attack_task(move_and_attack_task) * global.ai_primary_priority_scalar
				move_and_attack_task.priority_modifier += scr_ai_turn_prioirty_modifiers_move_and_attack_task(move_and_attack_task, flag_object)
				show_debug_message(string(move_and_attack_task) + " priority: " + string(move_and_attack_task.priority))
				show_debug_message(string(move_and_attack_task) + " priority modifier: " + string(move_and_attack_task.priority_modifier))
				ds_priority_add(queue, move_and_attack_task, move_and_attack_task.priority + move_and_attack_task.priority_modifier)
			}
		}
	
}

function generate_move_to_heal_tasks(executor, target_flag_object, queue){
	var center_executor = scr_get_center_of_occupied_cell(executor);
	with(obj_terrain_hospital){
		var center_target = scr_get_center_of_occupied_cell(self)
		generate_single_move_task(executor, center_executor[0], center_executor[1], center_target[0], center_target[1], target_flag_object, queue, obj_move_task, true)
	}	
}

function generate_wait_task(executor, target_flag_object,  queue){
	show_debug_message("Generating Wait Task")
	var	wait_task = instance_create_layer(0,0,"Logic",obj_wait_task)
	wait_task.priority = 0
	wait_task.controller =  global.ai_turn_controller
	wait_task.executor=executor
	wait_task.priority_modifier += scr_ai_turn_priority_modifiers_wait_task(wait_task, target_flag_object)
	show_debug_message("Task priority: " + string(wait_task.priority))
	show_debug_message("Task priority modifier: " + string(wait_task.priority_modifier))
	ds_priority_add(queue, wait_task, wait_task.priority + wait_task.priority_modifier)
}