// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_generate_tasks(executor, targets, queue){
	for(var i=0; i< ds_list_size(targets); i++){
		var target = ds_list_find_value(targets, i)
		// Generate Move tasks
		scr_ai_turn_generate_move_tasks(executor, target, queue)
		
		// Generate Move and Attack tasks
		
		// Generate Heal tasks
		
		// Generate 
		
	}
}

function scr_ai_turn_generate_move_tasks(executor, target, queue){
		// Get target position
		target_tile_x = scr_pixel_x_to_tile_x(target.x)
		target_tile_y = scr_pixel_y_to_tile_y(target.y)
		move_task = instance_create(obj_move_task, "Logic", 0, 0)
		priority = 0
		// Check if [x+1, y] is pathable and if yes, create a move task for it
		
		//We will re-use store the path in the task to re-use later
		
		// Calculate the priority of the move task
}