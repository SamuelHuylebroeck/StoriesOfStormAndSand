/// @description Insert description here
// You can write your code in this editor
if(executor.path_index == -1){
	show_debug_message("Move task complete")
	executor.has_acted_this_round = true
	controller.executing_task = false
	instance_destroy()
}