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
		scr_ai_turn_generate_tasks(current_executor, ds_active_targets, target_flag_object,  ds_current_priority_queue)
		if(ds_priority_size(ds_current_priority_queue) >0 ){
			//Start executing next task
			var next_task = ds_priority_find_max(ds_current_priority_queue)
			var max_priority = ds_priority_find_priority(ds_current_priority_queue, next_task)
			//Pop from queue
			ds_priority_delete_max(ds_current_priority_queue)
			// Clean up
			scr_clean_task_priority_queue(ds_current_priority_queue)
			// Execute task
			executing_task = true
			show_debug_message("Now executing task " + string(next_task.id) +", P: "+ string(max_priority))
			scr_execute_task(next_task)
		}else{
			show_debug_message("No task created for " + string(current_executor.id))
		}
	}
} else {
	//Wait until the tasks resolved and modifies the state variable
	//show_debug_message("Waiting for task to finish")
}

