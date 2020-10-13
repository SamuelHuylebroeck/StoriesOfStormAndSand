/// @description Insert description here
// You can write your code in this editor



// Check a task is being executed
if(!executing_task){
	//Check for end of turn
	if(ds_queue_size(ds_active_executors) < 1){
		global.ai_turn_completed = true
	}else{
		// Dequeue the next executor
		var current_executor = ds_queue_dequeue(ds_active_executors)
		// Build tasks list for this executor
		ds_priority_clear(ds_current_priority_queue)
		scr_ai_turn_generate_tasks(current_executor, ds_active_targets, ds_current_priority_queue)
		//Start executing next task
		var next_task = ds_priority_find_max(ds_current_priority_queue)
		//Pop from queue
		ds_priority_delete_max(ds_current_priority_queue)
		// Clean up
		scr_clean_task_priority_queue(ds_current_priority_queue)
		// Execute task
		executing_task = true
		show_debug_message("Now executing task " + string(next_task.id))
		scr_execute_task(next_task)
	}
} else {
	//Wait until the tasks resolved and modifies the state variable
}

