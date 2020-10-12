// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_generate_tasks(executor, targets, queue){
	debug_msg = string("Generating tasks")
	show_debug_message(debug_msg)
	for(var i=0; i< ds_list_size(targets); i++){
		var target = ds_list_find_value(targets, i)
		show_debug_message("Creating tasks with for a target")
		// Generate Move tasks
		scr_ai_turn_generate_move_tasks(executor, target, queue)
		
		// Generate Move and Attack tasks
		
		// Generate Heal tasks
		
		// Generate 
		
	}
}

function scr_ai_turn_generate_move_tasks(executor, target, queue){
		// Get target position
		var center_target = scr_get_center_of_occupied_cell(target);
		var center_executor = scr_get_center_of_occupied_cell(executor);
		//Todo iterate over all 8 cardinal positions
		generate_single_move_task(executor, queue, center_executor[0], center_executor[1], center_target[0] + global.grid_cell_width, center_target[1])
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
			if(path_get_length(path) < executor.stats_move_points_sqr * global.grid_cell_width){
				show_debug_message("Path calculated was longer than the units speed")
			}
			// Calculate the priority of the move task
			var	move_task = instance_create_layer(0,0,"Logic",obj_move_task)
			move_task.executor = executor
			move_task.path = path;
			move_task.priority = scr_ai_turn_priority_move_task_base(executor, move_task)
			show_debug_message(string(move_task.priority))
			ds_priority_add(queue, move_task, move_task.priority)
		}	
}