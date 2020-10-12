/// @description Insert description here
// You can write your code in this editor

// Check a task is being executed
if(executing_task){
	show_debug_message("Execting a task")
	//Do nothing
} else {
	// Dequeue the next executor
	var current_executor = ds_queue_dequeue(ds_active_executors)
	// Build tasks list for this executor
	ds_priority_clear(ds_current_priority_queue)
	scr_ai_turn_generate_tasks(current_executor, ds_active_targets, ds_current_priority_queue)
	//Start executing next task
	var next_task = ds_priority_find_max(ds_current_priority_queue)
	//Pop from queue
	ds_priority_delete_max(ds_current_priority_queue)
	// Execute task
	scr_execute_task(next_task)
		
}

