// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// @param queue queue to stuff the executors in
function scr_ai_turn_register_executors(queue){
	for (var k=0; k< ds_list_size(global.active_side.ds_active_units); k++) {
		var v = ds_list_find_value(global.active_side.ds_active_units, k);
		ds_queue_enqueue(queue, v);
	}
}