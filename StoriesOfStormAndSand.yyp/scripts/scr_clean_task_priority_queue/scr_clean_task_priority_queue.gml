// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_clean_task_priority_queue(priority_queue){
	var nr_of_elements = ds_priority_size(priority_queue);
	for (var i=0; i<nr_of_elements; i++){
		var v = ds_priority_find_max(priority_queue)
		ds_priority_delete_max(priority_queue)
		instance_destroy(v)
	}
}