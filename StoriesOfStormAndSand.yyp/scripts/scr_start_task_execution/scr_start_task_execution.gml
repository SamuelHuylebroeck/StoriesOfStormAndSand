// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_execute_task(task){
	show_debug_message("Executing a Task")
	switch(task.object_index){
		case obj_move_task:
			show_debug_message("Move")
			with(task){
				scr_start_move_task()
			}
			break;
		case obj_move_and_attack_task:
			show_debug_message("Move and Attack")
			with(task){
				scr_start_move_task()
			}
			break;
		case obj_attack_task:
			show_debug_message("Attack")
			with(task){
				scr_start_attack_task()
			}
			break;
		case obj_wait_task:
			show_debug_message("Wait")
			with(task){
				scr_start_wait_task()
			}
			break;
		default:
			show_debug_message("Task execution failed, task did not match a known type")
			break;
	}
}