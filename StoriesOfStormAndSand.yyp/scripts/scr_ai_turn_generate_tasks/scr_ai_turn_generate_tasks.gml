// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_generate_tasks(executor, targets, queue){
	debug_msg = string("Generating task for " + string(executor.id))
	show_debug_message(debug_msg)
	for(var i=0; i< ds_list_size(targets); i++){
		var target = ds_list_find_value(targets, i)
		show_debug_message("Creating tasks for target " + string(target.id))
		// Generate Move Closer tasks
		generate_move_closer_tasks(executor, target, queue)
		//Generate Attack tasks
		generate_attack_tasks(executor, target, queue)
		// Generate Move and Attack tasks
		generate_move_and_attack_tasks(executor, target, queue)
		// Generate Heal tasks
		
		// Generate wait tasks
		generate_wait_task(executor, queue)
	}
}

function generate_move_closer_tasks(executor, target, queue){
	// Get target position
	var center_target = scr_get_center_of_occupied_cell(target);
	var center_executor = scr_get_center_of_occupied_cell(executor);
	for( var i= -1; i<=1; i++){
		for (var j = -1; j<=1; j++){
			if(i!=0!=j){
				generate_single_move_task(executor, queue, center_executor[0], center_executor[1], center_target[0] + i*global.grid_cell_width, center_target[1] + j* global.grid_cell_height)
			}
		}
	}
}

function generate_single_move_task(executor, queue, source_x, source_y, target_x, target_y){
		// Check if [x+1, y] is pathable and if yes, create a move task for it
		mp_grid_clear_all(global.map_grid);
		scr_add_impassible_tiles_to_grid(executor);
		//Create the path
		var path = path_add();
		var path_found = mp_grid_path(global.map_grid, path, source_x, source_y, target_x, target_y, global.path_allow_diag);
		if (path_found){
			//Check if path length is within unit speed
			if(path_get_length(path) > executor.stats_move_points_sqr * global.grid_cell_width){
				//show_debug_message("Path length calculated was longer than the units speed")
				//show_debug_message("Unit speed: " + string(executor.stats_move_points_sqr))
				//show_debug_message("Path length in grid cells: " + string(path_get_length(path)))
				//Create a subpath out of the path
				var snip_length = floor(path_get_length(path)/global.grid_cell_width) - executor.stats_move_points_sqr
				for (var v=0; v<snip_length; v++){
					path_delete_point(path, path_get_number(path)-1)
				}
				//show_debug_message("New path length in grid cells: "+ string(path_get_length(path)))
			}
			show_debug_message("Generating Move Task")
			// Calculate the priority of the move task
			var	move_task = instance_create_layer(0,0,"Logic",obj_move_task)
			move_task.executor = executor
			move_task.path = path;
			move_task.controller = self;
			move_task.priority = scr_ai_turn_priority_move_task_base(move_task)  * global.ai_primary_priority_scalar
			move_task.priority_modifier += scr_ai_turn_prioirity_modifiers_move_task(move_task)
			show_debug_message("Task priority: " + string(move_task.priority))
			show_debug_message("Task priority modifier: " + string(move_task.priority_modifier))
			ds_priority_add(queue, move_task, move_task.priority + move_task.priority_modifier)
		} else {
			show_debug_message("Path not found")
		}
}

function generate_attack_tasks(executor, target, queue){
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
			attack_task.controller = self;
			attack_task.priority = scr_ai_turn_priority_attack_task(attack_task) * global.ai_primary_priority_scalar
			attack_task.priority_modifier += scr_ai_turn_priority_modifiers_attack_task(attack_task)
			show_debug_message("Task priority: " + string(attack_task.priority))
			show_debug_message("Task priority modifier: " + string(attack_task.priority_modifier))
			ds_priority_add(queue, attack_task, attack_task.priority + attack_task.priority_modifier)
		}else{
			show_debug_message(string(attack[attack_fields.name] +" was not in range"))
		}	
	}
	
}
	
function generate_move_and_attack_tasks(executor, target, queue){
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
					generate_single_move_and_attack_task(executor, target,target_x, target_y, attack, queue)					
				}
			}
		}
	}
}

function generate_single_move_and_attack_task(executor, target, target_x, target_y, attack, queue){
	//Generate a path
	mp_grid_clear_all(global.map_grid);
	scr_add_impassible_tiles_to_grid(executor);
	//Create the path
	var path = path_add();
	//Check if path is within movement range
	var center_executor = scr_get_center_of_occupied_cell(executor)
	var path_found = mp_grid_path(global.map_grid, path, center_executor[0], center_executor[1], target_x, target_y, global.path_allow_diag);
		if (path_found){
			//Check if path length is within unit speed
			if(path_get_length(path) < executor.stats_move_points_sqr * global.grid_cell_width){
				show_debug_message(string(attack[attack_fields.name] +" is in range after moving to ["+string(target_x) + ","+string(target_y) +"], creating task"))
				var	move_and_attack_task = instance_create_layer(0,0,"Logic",obj_move_and_attack_task)
				move_and_attack_task.executor = executor;
				move_and_attack_task.assigned_attack = attack
				move_and_attack_task.target = target
				move_and_attack_task.controller = self;
				move_and_attack_task.path = path
				move_and_attack_task.priority = scr_ai_turn_priority_move_and_attack_task(move_and_attack_task) * global.ai_primary_priority_scalar
				move_and_attack_task.priority_modifier += scr_ai_turn_prioirty_modifiers_move_and_attack_task(move_and_attack_task)
				show_debug_message("Task priority: " + string(move_and_attack_task.priority))
				show_debug_message("Task priority modifier: " + string(move_and_attack_task.priority_modifier))
				ds_priority_add(queue, move_and_attack_task, move_and_attack_task.priority + move_and_attack_task.priority_modifier)
			}
		}
	
}

function generate_wait_task(executor, queue){
	show_debug_message("Generating Wait Task")
	var	wait_task = instance_create_layer(0,0,"Logic",obj_wait_task)
	wait_task.priority = 0
	wait_task.controller = self
	wait_task.executor=executor
	wait_task.priority_modifier += scr_ai_turn_priority_modifiers_wait_task(wait_task)
	show_debug_message("Task priority: " + string(wait_task.priority))
	show_debug_message("Task priority modifier: " + string(wait_task.priority_modifier))
	ds_priority_add(queue, wait_task, wait_task.priority + wait_task.priority_modifier)
}