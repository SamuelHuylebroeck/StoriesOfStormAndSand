// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_initialize_controller(){
	// Gather tasks
	scr_ai_turn_register_executors(ds_active_executors)
	scr_ai_turn_register_targets()
}