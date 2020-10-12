/// @description Insert description here
// You can write your code in this editor

// Check a task is being executed
if(executing_task){
	show_debug_message("Execting a task")
	//Do nothing
} else {
	// Dequeue the next executor
	current_executor = ds_queue_dequeue(ds_active_executors)
	// Build tasks list for this executor
	ds_priority_clear(ds_current_priority_queue)
		
}

