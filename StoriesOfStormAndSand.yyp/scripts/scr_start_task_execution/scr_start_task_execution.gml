// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_execute_task(task){
	switch(task.object_index){
		case obj_move_task:
			with(task){
				scr_start_move_task()
			}
			break;
		default:
			show_debug_message("Task execution failed, task did not match a known type")
			break;
	}
}