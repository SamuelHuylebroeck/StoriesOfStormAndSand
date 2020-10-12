// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_register_targets(){
	ds_list_copy(ds_active_targets, global.inactive_side.ds_active_units)
}