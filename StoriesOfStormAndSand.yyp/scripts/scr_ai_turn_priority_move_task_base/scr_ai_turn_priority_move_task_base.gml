// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_priority_move_task_base(executor, task){
	var max_distance = global.grid_nr_h_cells * global.grid_cell_width + global.grid_nr_v_cells * global.grid_cell_height
	// Normalize score before returning
	return (max_distance - path_get_length(task.path)) / max_distance
}